resource "aws_vpc" "vpc_terraform" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-terraform"
  }
}

resource "aws_internet_gateway" "vpc_terraform_igw" {
  vpc_id = aws_vpc.vpc_terraform.id

  tags = {
    Name = "vpc_terraform_igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_terraform_igw.id
  }

  tags = {
    Name = "public_rt"
  }
}