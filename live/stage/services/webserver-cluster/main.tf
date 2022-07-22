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
  source = "github.com/jmik618/tf_up_and_running//services?ref=v0.0.1"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key    = var.db_remote_state_key
  instance_type          = "t2.micro"
  min_size               = 2
  max_size               = 10
}
