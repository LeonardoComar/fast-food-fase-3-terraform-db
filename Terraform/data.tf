data "aws_vpc" "fastfood_vpc" {
  filter {
    name   = "tag:Name"
    values = ["fastfood-vpc"]
  }
}

data "aws_subnet" "private_1" {
  filter {
    name   = "tag:Name"
    values = ["fastfood-subnet-private-1"]
  }
}

data "aws_subnet" "private_2" {
  filter {
    name   = "tag:Name"
    values = ["fastfood-subnet-private-2"]
  }
}

locals {
  subnet_privates_ids = [
    data.aws_subnet.private_1.id,
    data.aws_subnet.private_2.id
  ]
}

data "aws_security_group" "fastfood_security_group" {
  filter {
    name   = "group-name"
    values = ["fastfood-security-group"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.fastfood_vpc.id]
  }
}
