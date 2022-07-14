provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name          = "webservers-prod"
  db_remote_bucket_name = "tf-up-and-running-state-jm"
  db_remote_bucket_key  = "prod/data-stores/mysql/terraform.tfstate"
  instance_type         = "t3.large"
  min_size              = 4
  max_size              = 15
}
