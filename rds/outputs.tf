output "rds_endpoint" {
  description = "Endpoint do RDS"
  value       = module.db.db_instance_endpoint
}

output "db_password" {
  description = "Senha gerada do banco (apenas para debug; remova depois)"
  value       = var.db_password
  sensitive   = true
}
