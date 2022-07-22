provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "data-store-stage"
  allocated_storage   = 10
  engine              = "mysql"
  instance_class      = "db.t2.micro"
  db_name             = var.db_name
  password            = var.db_password
  username            = var.db_username
  skip_final_snapshot = true
}