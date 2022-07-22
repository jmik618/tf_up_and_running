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