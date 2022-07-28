provider "aws" {
  region = "us-east-2"
}

module "asg" {
  source = "../../modules/cluster/asg-rolling-deploy"

  cluster_name = var.cluster_name
  ami = "ami-03fd5809787d564a0"
  instance_type = "t2.micro"
  server_text = "This is the test example of prior to running prod or stage"

  min_size = 1
  max_size = 1
  enable_autoscaling = false

  subnet_ids = data.aws_subnet_ids.default.ids  
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}