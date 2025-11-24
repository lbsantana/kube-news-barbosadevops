module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.0"

  identifier = "${var.tags["project"]}-postgres"

  engine               = "postgres"
  engine_version       = "16.6"
  family               = "postgres16"

  # Free tier-friendly: t3.micro, single AZ, pouco storage
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  port     = 5432

  multi_az          = false
  storage_encrypted = true

  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.kube_news_rds.id]
  create_db_subnet_group = false
  db_subnet_group_name   = aws_db_subnet_group.kube_news.name

  deletion_protection     = false     # pra lab, false ajuda
  backup_retention_period = 1

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
