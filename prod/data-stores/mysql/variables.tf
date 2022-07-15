variable "db_password" {
  description = "The password for the database"
  type        = string
}

variable "identifier_prefix" {
  type        = string
  description = "The prefix name for the mysql database"
}

variable "db_remote_bucket_name" {
  type        = string
  description = "The name of the s3 bucket for the database's remote state"
}

variable "db_remote_bucket_key" {
  type        = string
  description = "The path for the database's remote state in s3"
}

variable "allocated_storage" {
  type        = string
  description = "The amount of storage to be allocated to the mysql database"
}

variable "engine" {
  type        = string
  description = "Setting the type of database(mysql) to be built and configured"
}

variable "instance_class" {
  type        = string
  description = "The type of EC2 instance that will be build for the database to run on"
}

variable "db_name" {
  type        = string
  description = "The name of the mysql database"
}

variable "username" {
  type        = string
  description = "The username of the user to be configured to log into the mysql database"
}
