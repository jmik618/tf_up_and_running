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
  type = string
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
  type = string
  description = "The AMI to run in the cluster"
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}

variable "server_text" {
  type = string
  description = "The text the web server should return"
}

variable "custom_tags" {
  type = map(string)
  description = "Custom tags to set on the Instances in the ASG"
  default = {}
}

variable "enable_autoscaling" {
  type = string
  description = "If set to true, enable auto scaling"
}