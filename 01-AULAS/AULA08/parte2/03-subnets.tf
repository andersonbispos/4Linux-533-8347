resource "aws_subnet" "subnet1" {

  vpc_id = aws_vpc.tf-vpc-lab.id

  cidr_block = var.subnets_cidr_list[0]

  availability_zone       = var.subnets_zones_list[0]
  map_public_ip_on_launch = var.public_ip_enabled

  tags = {
    Name = format("subnet-%s-%s", var.vpc_name, var.subnets_zones_list[0])
  }
}

resource "aws_route_table_association" "rt_public_subnet1_association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_subnet" "subnet2" {

  vpc_id = aws_vpc.tf-vpc-lab.id

  cidr_block = var.subnets_cidr_list[1]

  availability_zone       = var.subnets_zones_list[1]
  map_public_ip_on_launch = var.public_ip_enabled

  tags = {
    Name = format("subnet-%s-%s", var.vpc_name, var.subnets_zones_list[1])
  }
}

resource "aws_route_table_association" "rt_public_subnet2_association" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt_public.id
}