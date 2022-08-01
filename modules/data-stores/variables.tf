variable "db_password" {
  description = "The password for the database"
  type        = string
}

variable "db_name" {
  type        = string
  description = "The name of the mysql database"
  default = "stage"
}

variable "db_username" {
  type        = string
  description = "The username of the user to be configured to log into the mysql database"
  default = "admin"
}

variable "identifier_prefix" {
  type = string
  description = "The database identifier prefix that will be listed as part of the DB identifier"
}

variable "allocated_storage" {
  type = string
  description = "The amount of storage that should be allocated to the database"
}

variable "engine" {
  type = string
  description = "The type of database engine that should be deployed. I.E. 'mysql', 'postgres' or 'oracle'"
}

variable "instance_class" {
  type = string
  description = "The database server instance class type. I.E. 'db.t2.micro', 'db.t2.large' etc."
}

variable "username" {
  type = string
  description = "The admin username to log into the database"
}

variable "skip_final_snapshot" {
  type = string
  description = "Whether a final snapshot should be taken of the database before destruction. This is either 'true' or 'false'"
}

variable "environment" {
  type = string
  description = "The name of the environment we're deploying to"
}