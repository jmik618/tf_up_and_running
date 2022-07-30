provider "aws" {
  region = "us-east-2"

}

module "alb" {
  source = "../../modules/networking/alb"

  alb_name = "test-tf-up-and-running"
  subnet_ids = data.aws_subnets.default.ids
  
}