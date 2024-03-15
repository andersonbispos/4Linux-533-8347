resource "aws_vpc" "vpc_terraform" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-terraform"
  }
}

resource "aws_internet_gateway" "vpc_terraform_igw" {
  vpc_id = "vpc-014459aa098927e1b"

  tags = {
    Name = "vpc_terraform_igw"
  }
}