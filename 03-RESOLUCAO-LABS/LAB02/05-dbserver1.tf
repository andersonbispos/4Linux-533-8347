resource "aws_instance" "dbserver1" {
  ami           = "ami-08af887b5731562d3"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.subnet2.id

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "dbserver1"
  }
}