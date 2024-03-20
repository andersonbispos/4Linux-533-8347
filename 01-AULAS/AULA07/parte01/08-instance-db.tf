resource "aws_instance" "db" {
  ami           = var.amazon_ami
  instance_type = var.default_instance_type

  subnet_id = aws_subnet.subnet_private_2a.id

  vpc_security_group_ids = [aws_security_group.sg_default.id]

  tags = {
    Name = "db"
  }
}