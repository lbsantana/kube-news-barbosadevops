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

variable "eks_cluster" {
  type = object({
    name                              = string
    version                           = string
    enabled_cluster_log_types         = list(string)
    access_config_authentication_mode = string
    node_group_name                   = string
    node_group_instance_types         = list(string)
    node_group_capacity_type          = string
    scaling_config = object({
      desired_size = number
      max_size     = number
      min_size     = number
    })
  })
  default = {
    name                              = "kube-eks-cluster"
    version                           = "1.31"
    enabled_cluster_log_types         = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
    access_config_authentication_mode = "API_AND_CONFIG_MAP"
    node_group_name                   = "kubenews-eks-node-group"
    node_group_instance_types         = ["t3.micro"]
    node_group_capacity_type          = "ON_DEMAND"
    scaling_config = {
      desired_size = 5
      max_size     = 6
      min_size     = 3
    }
  }
}

variable "ecr_repositories" {
  type = list(object({
    name                 = string
    image_tag_mutability = string
  }))

  default = [
    {
      name                 = "kube-backend-repo"
      image_tag_mutability = "MUTABLE"
    }
  ]
}

locals {
  ecr_repositories_map = {
    for repo in var.ecr_repositories :
    repo.name => repo
  }
}
