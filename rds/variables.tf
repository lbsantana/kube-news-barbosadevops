variable "auth" {
  type = object({
    region          = string
    assume_role_arn = string
  })

  default = {
    region          = "us-east-2"
    assume_role_arn = "arn:aws:iam::667516053160:role/BarbosaDevopsKubeNewsRole"
  }
}

variable "tags" {
  type = map(string)
  default = {
    owner       = "devops"
    project     = "kube-news"
    environment = "dev"
  }
}

variable "db_settings" {
  description = "Configurações do banco RDS"
  type = object({
    name                   = string
    engine_version         = string
    family                 = string
    instance_class         = string
    allocated_storage      = number
    db_name                = string
    db_password            = string
    username               = string
    multi_az               = bool
    storage_encrypted      = bool
    deletion_protection    = bool
    backup_retention_period = number
  })
  sensitive = true

  default = {
    name                   = "postgres"
    engine_version         = "16.6"
    family                 = "postgres16"
    instance_class         = "db.t3.micro"
    allocated_storage      = 20
    multi_az               = false
    storage_encrypted      = true
    deletion_protection    = false
    backup_retention_period = 1
    db_name                = "kubedevnews"
    username               = "kubedevnews"
    db_password            = "(VJ7fbVmW5$FLOrDq!7F26>O)dp!"
  }
}

