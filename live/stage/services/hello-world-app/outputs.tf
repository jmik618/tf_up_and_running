output "alb_dns_name" {
  depends_on  = [module.webserver-cluster.alb_dns_name]
  value       = module.webserver-cluster.alb_dns_name
  description = "The domain name of the load balancer"
}

output "asg_name" {
  depends_on  = [module.webserver-cluster.asg_name]
  value       = module.webserver-cluster.asg_name
  description = "The name of the Auto Scaling Group"
}

output "asg_instance_security_group_id" {
  depends_on  = [module.webserver-cluster.asg_instance_security_group_id]
  value       = module.webserver-cluster.asg_instance_security_group_id
  description = "The ID of the EC2 Instance Security Group"
}

output "alb_http_listener_arn" {
  depends_on  = [module.webserver-cluster.alb_http_listener_arn]
  value       = module.webserver-cluster.alb_http_listener_arn
  description = "The ARN of the HTTP listener"
}

output "alb_security_group_id" {
  depends_on  = [module.webserver-cluster.alb_security_group_id]
  value       = module.webserver-cluster.alb_security_group_id
  description = "The ALB Security Group ID"
}

output "db_address" {
  depends_on  = [module.webserver-cluster.db_address]
  value       = module.webserver-cluster.db_address
  description = "Connect to the database at this endpoint"
}

output "db_port" {
  depends_on  = [module.webserver-cluster.db_port]
  value       = module.webserver-cluster.db_port
  description = "The port the database is listening on"
}