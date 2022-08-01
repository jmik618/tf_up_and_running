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
  #source = "github.com/jmik618/modules.git//services/webserver-cluster?ref=v0.0.2"
  source = "../../../../modules/services/hello-world-app"

  server_text            = var.server_text
  environment            = "prod"
  db_remote_state_bucket = "tf-up-and-running-state-jm"
  db_remote_state_key    = "prod/services/webserver-cluster/terraform.tfstate"
  instance_type          = "t2.micro"
  min_size               = 4
  max_size               = 15
  enable_autoscaling     = true
  ami                    = "ami-03fd5809787d564a0"
  identifier_prefix      = "data-store-prod"
  allocated_storage      = 10
  engine                 = "mysql"
  instance_class         = "db.t2.micro"
  db_name                = "prod"
  db_password            = var.db_password
  username               = "admin"
  skip_final_snapshot    = true

  custom_tags = {
    Owner = "DevOps-Prod"
    DevelopedBy = "terraform"
  }
}

