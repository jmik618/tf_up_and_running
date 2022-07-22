variable "db_password" {
  description = "The password for the database"
  type        = string
}

variable "indentifier_prefix" {
  type        = string
  description = "The prefix name for the mysql database"
  default = "data-store-stage"
}

variable "allocated_storage" {
  type        = string
  description = "The amount of storage to be allocated to the mysql database"
  default = 10
}

variable "engine" {
  type        = string
  description = "Setting the type of database(mysql) to be built and configured"
  default = "mysql"
}

variable "instance_class" {
  type        = string
  description = "The type of EC2 instance that will be build for the database to run on"
  default = "db.t2.micro"
}

variable "db_name" {
  type        = string
  description = "The name of the mysql database"
  default = "stage"
}

variable "username" {
  type        = string
  description = "The username of the user to be configured to log into the mysql database"
  default = "admin"
}

variable "db_remote_bucket_name" {
  type = string
  description = "describe your variable"
  default = "tf-up-and-running-state-jm"
}

variable "db_remote_bucket_key" {
  type = string
  description = "describe your variable"
  default = "stage/data-stores/mysql/terraform.tfstate"
}