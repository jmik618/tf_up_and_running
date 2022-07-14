provider "aws" {
  region = "us-east-2"
}

module "data-stores" {
  source = "../../../modules/data-stores/mysql"

  identifier_prefix     = "data-store-prod"
  db_remote_bucket_name = "tf-up-and-running-state-jm"
  db_remote_bucket_key  = "stage/data-stores/mysql/terraform.tfstate"
  allocated_storage     = 10
  engine                = "mysql"
  instance_class        = "db.t2.micro"
  db_name               = "prod"
  username              = "admin"
}
