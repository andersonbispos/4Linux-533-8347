resource "aws_subnet" "subnet_public_2a" {
  vpc_id     = "vpc-014459aa098927e1b"
  cidr_block = "10.0.1.0/24"

  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_public_2a"
  }
}

resource "aws_subnet" "subnet_private_2a" {
  vpc_id     = "vpc-014459aa098927e1b"
  cidr_block = "10.0.2.0/24"

  availability_zone = "us-east-2a"

  tags = {
    Name = "subnet_private_2a"
  }
}