provider "aws" {
  region = "us-east-2"
}

module "data-store" {
  #source = "github.com/jmik618/modules.git//services/webserver-cluster?ref=v0.0.2"
  source = "../../../../modules/data-stores"

  identifier_prefix   = "data-store-stage"
  allocated_storage   = 10
  engine              = "mysql"
  instance_class      = "db.t2.micro"
  db_name             = "stage"
  db_password         = var.db_password
  username            = "admin"
}