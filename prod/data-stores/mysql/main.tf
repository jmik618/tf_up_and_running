provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = var.identifier_prefix
  allocated_storage   = var.allocated_storage
  engine              = var.engine
  instance_class      = var.instance_class
  db_name             = var.db_name
  password            = var.db_password
  username            = var.username
  skip_final_snapshot = true
}

