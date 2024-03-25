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

  availability_zone       = format("%sa", var.region)
  map_public_ip_on_launch = true

  tags = {
    Name = format("%s-public-%s", var.vpc_name, format("%sa", var.region))
  }
}

resource "aws_route_table_association" "public_rt_to_subnet_public" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_security_group" "sg_default" {
  name        = "vpc_terraform_allow_default"
  description = "Allow default inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_4linux.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}