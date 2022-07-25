variable "user_names" {
  type = list(string)
  description = "Create IAM users with these names"
  default = ["neo", "trinity", "morpheus"]
}

variable "give_neo_cloudwatch_full_access" {
  type = bool
  description = "If true, neo gets full access to Cloudwatch"
}