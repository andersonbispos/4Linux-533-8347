resource "aws_subnet" "vpc_teste_subnet1" {
  vpc_id            = local.vpcid
  availability_zone = var.default_zone
  cidr_block        = "192.168.10.0/24"

  tags = {
    Name = "vpc_teste_subnet1"
  }
}

resource "aws_subnet" "vpc_teste_subnet2" {
  vpc_id            = local.vpcid  
  availability_zone = var.default_zone
  cidr_block        = "192.168.20.0/24"

  tags = {
    Name = "vpc_teste_subnet2"
  }
}