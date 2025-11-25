resource "aws_security_group" "kube_news_rds" {
  name = "${var.tags["project"]}-rds-sg"
  description = "Allow Postgres access from VPC"
  vpc_id      = data.aws_vpc.this.id

  ingress {
    description = "Postgres from VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}
