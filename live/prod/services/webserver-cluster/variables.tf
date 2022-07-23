variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type        = string
  default = "tf-up-and-running-state-jm"
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  type        = string
  default = "prod/data-stores/mysql/terraform.tfstate"
}