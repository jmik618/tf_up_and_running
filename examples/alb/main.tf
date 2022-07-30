provider "aws" {
  region = "us-east-2"

}

module "alb" {
  source = "github.com/jmik618/tf_up_and_running.git//modules/networking/alb"

  alb_name = "test-tf-up-and-running"
  subnet_ids = data.aws_subnet_ids.default.ids
  
}