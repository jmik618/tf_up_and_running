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
  enable_autoscaling     = true
  enable_new_user_data   = true

  custom_tags = {
    Owner = "DevOps-Prod"
    DevelopedBy = "terraform"
  }
}

