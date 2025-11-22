variable auth {
type = object({
    region = string
    assume_role_arn = string
  })

default = {
    region = "us-east-2"
    assume_role_arn = "arn:aws:iam::667516053160:role/BarbosaDevopsKubeNewsRole"
  }
}

variable "tags" {
  type = map(string)
  default = {
    owner = "devops"
    project = "kube-news"
    environment = "dev"
  }
}

variable "remote_backend" {
  type = object({
    bucket_name = string
  })

  default = {
    bucket_name = "barbosadevops-remote-state-backend-667516053160"
  }
}

