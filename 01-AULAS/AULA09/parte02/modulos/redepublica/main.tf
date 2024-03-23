resource "aws_vpc" "vpc_4linux" {

  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_4linux.id

  tags = {
    Name = format("igw_%s", var.vpc_name)
  }
}

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc_4linux.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = format("rt_public_%s", var.vpc_name)
  }
}

resource "aws_subnet" "subnet_public" {
  vpc_id     = aws_vpc.vpc_4linux.id

  cidr_block = cidrsubnet(var.vpc_cidr,8,1)

  availability_zone       = format("$sa", var.region)
  map_public_ip_on_launch = true

  tags = {
    Name = format("%s-public-%s", var.vpc_name, format("$sa", var.region))
  }
}

resource "aws_route_table_association" "public_rt_to_subnet_public" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.public_rt.id
}