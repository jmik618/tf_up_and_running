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
  source = "../../modules/services/hello-world-app/"

  server_text            = "This is the example/automation tests"
  environment            = "example"
  db_remote_state_bucket = "tf-up-and-running-state-jm"
  db_remote_state_key    = "examples/terraform.tfstate"
  instance_type          = "t2.micro"
  min_size               = 2
  max_size               = 2
  enable_autoscaling     = false
  ami                    = "ami-03fd5809787d564a0"
}