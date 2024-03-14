resource "aws_vpc" "vpc_terraform" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-terraform"
  }
}

resource "aws_internet_gateway" "vpc_terraform_igw" {
  vpc_id = "vpc-0702f3e84145d8d8c"

  tags = {
    Name = "vpc_terraform_igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = "vpc-0702f3e84145d8d8c"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0b6c92b2816b9c6ea"
  }

  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = "vpc-0702f3e84145d8d8c"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "nat-0685547f2b2ca6978"
  }

  tags = {
    Name = "private_rt"
  }
}

resource "aws_eip" "nat_gw_ip" {

  tags = {
    Name = "nat_gw_ip"
  }
}