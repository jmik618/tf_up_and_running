provider "aws" {
  region = "us-east-2"
}

module "webserver-cluster" {
  #source = "github.com/jmik618/tf_up_and_running//services?ref=v0.0.1"
  source = "../../../../modules/services/webserver-cluster"

  cluster_name          = "webservers-stage"
  remote_bucket_name = "tf-up-and-running-state-jm"
  remote_bucket_key = "stage/services/webserver-cluster/terraform.tfstate"
  db_remote_bucket_name = "tf-up-and-running-state-jm"
  db_remote_bucket_key  = "stage/data-stores/webserver-cluster/terraform.tfstate"
  instance_type         = "t2.micro"
  min_size              = 2
  max_size              = 10
}
