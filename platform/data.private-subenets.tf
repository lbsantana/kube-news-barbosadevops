data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = ["kubenews-vpc-private-subnet-*"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }
}
