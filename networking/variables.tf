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

variable "vpc" {
  type = object({
    name = string
    cidr_block = string
    internet_gateway_name = string
    nat_gateway_name        = string
    public_route_table_name = string
    private_route_table_name = string
    public_subnets = list(object({
      name = string
      cidr_block = string
      availability_zone = string
      map_public_ip_on_launch = bool
    }))
    private_subnets = list(object({
      name = string
      cidr_block = string
      availability_zone = string
      map_public_ip_on_launch = bool
    }))
  })
  default = {
    cidr_block = "10.0.0.0/24"
    name = "kubenews-vpc"
    internet_gateway_name = "kubenews-igw"
    nat_gateway_name        = "kubenews-nat-gateway"
    public_route_table_name = "kubenews-public-rt"
    private_route_table_name = "kubenews-private-rt"
    public_subnets = [{
        name = "kubenews-vpc-public-subnet-1a"
        cidr_block = "10.0.0.0/26"
        availability_zone = "us-east-2a"
        map_public_ip_on_launch = true
      },
      {
        name = "kubenews-vpc-public-subnet-1b"
        cidr_block = "10.0.0.64/26"
        availability_zone = "us-east-2b"
        map_public_ip_on_launch = true
      }
    ]

    private_subnets = [{
        name = "kubenews-vpc-private-subnet-1a"
        cidr_block = "10.0.0.128/26"
        availability_zone = "us-east-2a"
        map_public_ip_on_launch = false
    },
    {
        name = "kubenews-vpc-private-subnet-1b"
        cidr_block = "10.0.0.192/26"
        availability_zone = "us-east-2b"
        map_public_ip_on_launch = false
    }]
  }
}
