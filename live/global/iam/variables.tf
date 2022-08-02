variable "user_names" {
  type        = list(string)
  description = "Create IAM users with these names"
  default     = ["neo", "trinity", "morpheus"]
}

variable "give_neo_cloudwatch_full_access" {
  type        = bool
  description = "If true, neo gets full access to Cloudwatch"
}

variable "local_user" {
  type        = string
  description = "This is to set the current user who is running the TF code as a tag in order to track who modified the code"
}