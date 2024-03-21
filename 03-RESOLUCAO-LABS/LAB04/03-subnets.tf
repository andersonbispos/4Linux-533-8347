resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.tf-vpc-lab.id
  cidr_block = var.subnet1_cidr

  availability_zone       = var.subnet1_zone
  map_public_ip_on_launch = var.public_ip_enabled

  tags = {
    Name = "subnet1"
  }
}

resource "aws_route_table_association" "rt_public_subnet1_association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.tf-vpc-lab.id
  cidr_block = var.subnet2_cidr

  availability_zone       = var.subnet2_zone
  map_public_ip_on_launch = var.public_ip_enabled

  tags = {
    Name = "subnet2"
  }
}

resource "aws_route_table_association" "rt_public_subnet2_association" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt_public.id
}