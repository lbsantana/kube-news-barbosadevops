# outputs.tf
output "rds_endpoint" {
  value       = module.db.db_instance_endpoint
  description = "Endpoint do RDS"
}

output "db_password" {
  value       = var.db_password
  sensitive   = true
}
