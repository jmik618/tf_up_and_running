variable "alb_name" {
  type        = string
  description = "The name to use for this ALB"
}

variable "subnet_ids" {
  description = "The subnet IDs to deploy to"
  type        = list(string)
}