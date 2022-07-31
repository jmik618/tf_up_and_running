variable "server_text" {
  type = string
  description = "The text the webs server should return"
  default = "Does this shit work?!?"
}

variable "db_password" {
  description = "The password for the database"
  type        = string
}