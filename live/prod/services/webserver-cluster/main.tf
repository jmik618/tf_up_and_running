terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

module "webserver-cluster" {
  source = "github.com/jmik618/modules.git//services/webserver-cluster?ref=v0.0.1"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key    = var.db_remote_state_key
  instance_type          = "t2.micro"
  min_size               = 4
  max_size               = 15
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  depends_on             = [module.webserver-cluster.asg_name]
  autoscaling_group_name = module.webserver-cluster.asg_name
  scheduled_action_name  = "scale-out-during-business-hours"
  min_size               = 2
  max_size               = 10
  desired_capacity       = 10
  recurrence             = "0 9 * * *"
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  depends_on             = [module.webserver-cluster.asg_name]
  autoscaling_group_name = module.webserver-cluster.asg_name
  scheduled_action_name  = "scale-in-at-night"
  min_size               = 2
  max_size               = 10
  desired_capacity       = 2
  recurrence             = "0 17 * * *"
}
