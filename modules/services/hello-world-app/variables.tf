variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  type        = string
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "environment" {
  type        = string
  description = "The name of the environment we're deploying to"
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
}

variable "ami" {
  type        = string
  description = "The AMI to run in the cluster"
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}

variable "server_text" {
  type        = string
  description = "The text the web server should return"
}

variable "custom_tags" {
  type        = map(string)
  description = "Custom tags to set on the Instances in the ASG"
  default     = {}
}

variable "enable_autoscaling" {
  type        = string
  description = "If set to true, enable auto scaling"
}

variable "db_password" {
  description = "The password for the database"
  type        = string
}

variable "db_name" {
  type        = string
  description = "The name of the mysql database"
  default     = "stage"
}

variable "db_username" {
  type        = string
  description = "The username of the user to be configured to log into the mysql database"
  default     = "admin"
}

variable "identifier_prefix" {
  type        = string
  description = "The database identifier prefix that will be listed as part of the DB identifier"
}

variable "allocated_storage" {
  type        = string
  description = "The amount of storage that should be allocated to the database"
}

variable "engine" {
  type        = string
  description = "The type of database engine that should be deployed. I.E. 'mysql', 'postgres' or 'oracle'"
}

variable "instance_class" {
  type        = string
  description = "The database server instance class type. I.E. 'db.t2.micro', 'db.t2.large' etc."
}

variable "username" {
  type        = string
  description = "The admin username to log into the database"
}

variable "skip_final_snapshot" {
  type        = string
  description = "Whether a final snapshot should be taken of the database before destruction. This is either 'true' or 'false'"
}