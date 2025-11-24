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

variable "db_name" {
  type        = string
  default     = "kubedevnews"
}

variable "db_username" {
  type        = string
  default     = "kubedevnews"
}

variable "db_password" {
  type        = string
  default     = "(VJ7fbVmW5$FLOrDq!7F26>O)dp!"  # exemplo forte pra lab
  sensitive   = true
  description = "Senha do banco RDS."
}
