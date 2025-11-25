module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.0"

  identifier = "${var.tags["project"]}-postgres"

  engine               = var.db_settings.name
  engine_version       = var.db_settings.engine_version
  family               = var.db_settings.family

  instance_class    =  var.db_settings.instance_class
  allocated_storage = var.db_settings.allocated_storage

  db_name  = var.db_settings.db_name
  username = var.db_settings.username
  password = var.db_settings.db_password
  port     = 5432

  multi_az          = var.db_settings.multi_az
  storage_encrypted = var.db_settings.storage_encrypted

  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.kube_news_rds.id]
  create_db_subnet_group = false
  db_subnet_group_name   = aws_db_subnet_group.kube_news.name

  deletion_protection     = var.db_settings.deletion_protection
  backup_retention_period = var.db_settings.backup_retention_period

  tags = var.tags
}

resource "aws_db_subnet_group" "kube_news" {
  name        = "${var.tags["project"]}-rds-subnet-group"
  description = "Private subnets for kube-news RDS"
  subnet_ids  = data.aws_subnets.private.ids

  tags = var.tags

  lifecycle {
    precondition {
      condition     = length(data.aws_subnets.private.ids) > 0
      error_message = "Nenhuma subnet privada encontrada com tag Name kubenews-vpc-private-subnet-* na VPC kubenews-vpc."
    }
  }
}
