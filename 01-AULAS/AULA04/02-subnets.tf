resource "aws_subnet" "subnet_public_2a" {
  vpc_id     = "vpc-0702f3e84145d8d8c"
  cidr_block = "10.0.1.0/24"

  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_public_2a"
  }
}

resource "aws_route_table_association" "public_rt_to_subnet_public" {
  subnet_id      = "subnet-026b698ae237de94c"
  route_table_id = "rtb-047ffb1ffda4878d8"
}

# resource "aws_nat_gateway" "example" {
#   allocation_id = aws_eip.example.id
#   subnet_id     = "subnet-026b698ae237de94c"

#   tags = {
#     Name = "gw NAT"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.example]
# }

resource "aws_subnet" "subnet_private_2a" {
  vpc_id     = "vpc-0702f3e84145d8d8c"
  cidr_block = "10.0.2.0/24"

  availability_zone = "us-east-2a"

  tags = {
    Name = "subnet_private_2a"
  }
}