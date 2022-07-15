variable "server_port" {
  description = "The port the server will use for the HTTP requests"
  type        = number
  default     = 8080
}

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

#variable "db_remote_bucket_name" {
#  description = "The name of the s3 bucket for the database's remote state"
#  type        = string
#}
#
#variable "db_remote_bucket_key" {
#  description = "The path for the database's remote state in s3"
#  type        = string
#}

variable "remote_bucket_name" {
  description = "The name of the s3 bucket for the database's remote state"
  type        = string
}

variable "remote_bucket_key" {
  description = "The path for the database's remote state in s3"
  type        = string
}

variable "instance_type" {
  type        = string
  description = "The type of EC2 to run (e.g. t2.micro"
}

variable "min_size" {
  type        = string
  description = "The minimum number of EC2 instances in the ASG"
}

variable "max_size" {
  type        = string
  description = "The maximum number of EC2 instances in the ASG"
}

variable "data-stores" {}
