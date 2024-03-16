# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_subnet" "subnet_felipe2" {

  vpc_id = aws_vpc.vpc_terraform.id
  availability_zone                              = "us-east-2c"
  cidr_block                                     = "10.0.20.0/24"

  tags = {
    Name = "subnet2"
  }
  tags_all = {
    Name = "subnet2"
  }
}

# __generated__ by Terraform
resource "aws_subnet" "subnet_felipe1" {
  vpc_id = aws_vpc.vpc_terraform.id
  availability_zone                              = "us-east-2b"

  cidr_block                                     = "10.0.10.0/24"

  tags = {
    Name = "subnet1"
  }
  tags_all = {
    Name = "subnet1"
  }
}
