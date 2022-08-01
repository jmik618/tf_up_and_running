variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "ami" {
  type = string
  description = "The AMI to run in the cluster"
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "enable_autoscaling" {
  type = bool
  description = "If set to true, enable auto scaling"
}

variable "custom_tags" {
  type = map(string)
  description = "Custom tags to set on the Instances in the ASG"
  default = {}
}

variable "server_text" {
  type = string
  description = "The text the web server should return"
}

variable "subnet_ids" {
  type = list(string)
  description = "The subnet IDs to deploy to"
}

variable "target_group_arns" {
  type = list(string)
  description = "The ARNs of ELB target groups in which to register Instances"
  default = []
}

variable "health_check_type" {
  type = string
  description = "The type of health check to perform. Must be on of: EC2, ELB."
  default = "EC2"
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  type        = string
}

variable "db_address" {
  type = string
  description = "The address for the mysql database"
}

variable "db_port" {
  type = string
  description = "The port used for administering the mysql database"
}