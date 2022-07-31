terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

module "data-store" {
  #source = "github.com/jmik618/modules.git//services/webserver-cluster?ref=v0.0.2"
  source = "../../data-stores"

  identifier_prefix   = "data-store-stage"
  allocated_storage   = 10
  engine              = "mysql"
  instance_class      = "db.t2.micro"
  db_name             = "stage"
  db_password         = var.db_password
  username            = "admin"
}

module "asg" {
  depends_on = [module.data-store]
  source = "../../cluster/asg-rolling-deploy"

  cluster_name = "hello-world-${var.environment}"
  ami = var.ami
  instance_type = var.instance_type
  server_text = "Lets see if this shit works"

  min_size = var.min_size
  max_size = var.max_size
  enable_autoscaling = var.enable_autoscaling

  subnet_ids = data.aws_subnets.default.ids
  target_group_arns = [aws_lb_target_group.asg.arn]
  health_check_type = "ELB"
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key = var.db_remote_state_key

  custom_tags = var.custom_tags  
}

module "alb" {
  source = "../../networking/alb"

  alb_name = "hello-world-${var.environment}"
  subnet_ids = data.aws_subnets.default.ids
}

resource "aws_lb_target_group" "asg" {
  name     = "hello-world-${var.environment}"
  port     = var.server_port
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener_rule" "asg" {
  listener_arn = module.alb.alb_http_listener_arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg.arn
  }

  condition {
    path_pattern {
      values = ["*"]
    }
  }
}
