output "address" {
  value       = module.data-store.address
  description = "Connect to the database at this endpoint"
}

output "port" {
  value       = module.data-store.port
  description = "The port the database is listening on"
}
