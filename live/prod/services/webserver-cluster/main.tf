provider "aws" {
  region = "us-east-2"
}

module "webserver-cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name       = "webservers-prod"
  remote_bucket_name = "tf-up-and-running-state-jm"
  remote_bucket_key  = "prod/services/webserver-cluster/terraform.tfstate"
  instance_type      = "t3.large"
  min_size           = 4
  max_size           = 15
  data-stores        = module.data-stores
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  depends_on             = [module.webserver-cluster.asg_name]
  autoscaling_group_name = module.webserver-cluster.asg_name
  scheduled_action_name  = "scale-out-during-business-hours"
  min_size               = 2
  max_size               = 10
  desired_capacity       = 10
  recurrence             = "0 9 * * *"
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  depends_on             = [module.webserver-cluster.asg_name]
  autoscaling_group_name = module.webserver-cluster.asg_name
  scheduled_action_name  = "scale-in-at-night"
  min_size               = 2
  max_size               = 10
  desired_capacity       = 2
  recurrence             = "0 17 * * *"
}
