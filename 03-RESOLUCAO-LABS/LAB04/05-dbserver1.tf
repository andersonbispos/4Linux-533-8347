resource "aws_instance" "dbserver1" {
  ami           = var.default_ami
  instance_type = var.default_instance_size

  subnet_id = aws_subnet.subnet2.id

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = var.dbserver1_name
  }
}