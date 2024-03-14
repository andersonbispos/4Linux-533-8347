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

# resource "aws_nat_gateway" "nat_gw" {
#   allocation_id = "eipalloc-09f075900a6667bac"
#   subnet_id     = "subnet-026b698ae237de94c"

#   tags = {
#     Name = "nat_gw"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   #   depends_on = [aws_internet_gateway.example]
# }

resource "aws_subnet" "subnet_private_2a" {
  vpc_id     = "vpc-0702f3e84145d8d8c"
  cidr_block = "10.0.2.0/24"

  availability_zone = "us-east-2a"

  tags = {
    Name = "subnet_private_2a"
  }
}

# resource "aws_route_table_association" "private_rt_to_subnet_private" {
#   subnet_id      = "subnet-0a25b844b55bc79b1"
#   route_table_id = "rtb-06809a87c36b45f04"
# }