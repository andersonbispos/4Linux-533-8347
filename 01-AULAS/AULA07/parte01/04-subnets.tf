resource "aws_subnet" "subnet_public_2a" {
  vpc_id     = aws_vpc.vpc_terraform.id
  cidr_block = var.public_cidr

  availability_zone       = var.subnet_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_public_2a"
  }
}

resource "aws_subnet" "subnet_private_2a" {
  vpc_id     = aws_vpc.vpc_terraform.id
  cidr_block = var.private_cidr

  availability_zone = var.subnet_zone

  tags = {
    Name = "subnet_private_2a"
  }
}