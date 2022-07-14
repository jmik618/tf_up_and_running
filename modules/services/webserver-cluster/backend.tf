terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket = var.db_remote_bucket_name
    key    = var.db_remote_bucket_key
    region = "us-east-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "tf-up-and-running-locks"
    encrypt        = true
  }
}
