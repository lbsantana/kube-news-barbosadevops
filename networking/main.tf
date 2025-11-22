terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
backend "s3" {
    bucket         = "barbosadevops-remote-state-backend-667516053160"
    key            = "networking/terraform.tfstate"
    region         = "us-east-2"
    use_lockfile = true
  }
}

provider "aws" {
  region = var.auth.region

default_tags {
  tags =  var.tags
  }

assume_role {
  role_arn = var.auth.assume_role_arn
  }
}

