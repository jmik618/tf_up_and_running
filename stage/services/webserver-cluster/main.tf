provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name          = "webservers-stage"
  db_remote_bucket_name = "tf-up-and-running-state-jm"
  db_remote_bucket_key  = "stage/data-stores/webserver-cluster/terraform.tfstate"
  instance_type         = "t2.micro"
  min_size              = 2
  max_size              = 10
}
