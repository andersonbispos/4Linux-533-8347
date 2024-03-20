resource "aws_subnet" "subnet_public_2a" {
  vpc_id     = aws_vpc.vpc_terraform.id
  cidr_block = var.public_cidr

  availability_zone       = var.subnet_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_public_2a"
  }
}

resource "aws_route_table_association" "public_rt_to_subnet_public" {
  subnet_id      = aws_subnet.subnet_public_2a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_subnet" "subnet_private_2a" {
  vpc_id     = aws_vpc.vpc_terraform.id
  cidr_block = var.private_cidr

  availability_zone = var.subnet_zone

  tags = {
    Name = "subnet_private_2a"
  }
}