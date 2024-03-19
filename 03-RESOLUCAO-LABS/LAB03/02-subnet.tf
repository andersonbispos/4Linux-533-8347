# vpc-03b82e955b84e64d9

resource "aws_subnet" "vpc_teste_subnet1" {
  vpc_id            = "vpc-03b82e955b84e64d9"
  # vpc_id            = aws_vpc.vpc_teste.id
  availability_zone = "us-east-2a"
  cidr_block        = "192.168.10.0/24"

  tags = {
    Name = "vpc_teste_subnet1"
  }
}

resource "aws_subnet" "vpc_teste_subnet2" {
  vpc_id            = "vpc-03b82e955b84e64d9"  
  # vpc_id            = aws_vpc.vpc_teste.id
  availability_zone = "us-east-2a"
  cidr_block        = "192.168.20.0/24"

  tags = {
    Name = "vpc_teste_subnet2"
  }
}