resource "aws_instance" "db" {
  ami           = "ami-0e0bf53f6def86294"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.subnet_private_2a.id

  vpc_security_group_ids = [ aws_security_group.sg_default.id ]

  tags = {
    Name = "db"
  }
}