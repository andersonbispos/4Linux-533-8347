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

resource "aws_route_table_association" "public_rt_to_subnet_public" {
  subnet_id      = aws_subnet.subnet_public_2a.id
  route_table_id = aws_route_table.public_rt.id
}