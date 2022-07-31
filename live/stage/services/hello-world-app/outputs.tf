output "alb_dns_name" {
  depends_on = [module.webserver-cluster.alb_dns_name]
  value       = module.webserver-cluster.alb_dns_name
  description = "The domain name of the load balancer"
}

#output "address" {
#  depends_on  = [module.data-store.address]
#  value       = module.data-store.address
#  description = "Connect to the database at this endpoint"
#}
#
#output "port" {
#  depends_on  = [module.data-store.port]
#  value       = module.data-store.port
#  description = "The port the database is listening on"
#}