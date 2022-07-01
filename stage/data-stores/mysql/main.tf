provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  allocated_storage   = 10
  engine              = "mysql"
  instance_class      = "db.t2.micro"
  db_name             = "example_database"
  password            = var.db_password
  username            = "admin"
  skip_final_snapshot = true
}

#data "aws_secretsmanager_secret_version" "db_password" {
#  secret_id = "mysql-master-password-stage"
#}

#data "terraform_remote_state" "db" {
#  backend = s3
#
#  config = {
#    bucket = "tf-up-and-running-state-jm"
#    key    = "stage/data-stores/mysql/terraform.tfstate"
#    region = "us-east-2"
#  }
#}

