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