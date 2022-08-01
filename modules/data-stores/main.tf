provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "data-store-${var.environment}"
  allocated_storage   = var.allocated_storage
  engine              = var.engine
  instance_class      = var.instance_class
  db_name             = var.db_name
  password            = var.db_password
  username            = var.db_username
  skip_final_snapshot = var.skip_final_snapshot
}