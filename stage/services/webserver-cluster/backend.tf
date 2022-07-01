terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "tf-up-and-running-state-jm"
    key    = "stage/services/webserver-cluster/terraform.tfstate"
    region = "us-east-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "tf-up-and-running-locks"
    encrypt        = true
  }
}
