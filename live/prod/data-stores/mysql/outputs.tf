output "address" {
  value       = aws_db_instance.example.address
  description = "Connect to the database at this endpoint"
}

output "port" {
  value       = aws_db_instance.example.port
  description = "The port the database is listening on"
}

output "db_remote_bucket_name" {
  value       = var.db_remote_bucket_name
  description = "This output will be used to configure the Web Server ASG group"
}

output "db_remote_bucket_key" {
  value       = var.db_remote_bucket_key
  description = "This output will be used to configure the Web Server ASG group"
}
