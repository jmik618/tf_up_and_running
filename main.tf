provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-03fd5809787d564a0"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}
