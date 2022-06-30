provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "tf-up-and-running-state-jm"
}

#resource "aws_s3_bucket_lifecycle_configuration" "terraform_state" {
# Prevent accidental deletion of this s3 bucket
#  bucket = aws_s3_bucket.terraform_state.bucket
#  rule {
#    id = "prevent_destroy"
#    status = "Enabled"
#    prevent_destroy = true
#  }
#}

resource "aws_s3_bucket_versioning" "terraform_state" {
  # Enable versioning so we can see the full revision history of our
  # state files
  bucket = aws_s3_bucket.terraform_state.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  # Enable server-side encryption by default
  bucket = aws_s3_bucket.terraform_state.bucket

  rule {
    bucket_key_enabled = false
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "tf-up-and-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

