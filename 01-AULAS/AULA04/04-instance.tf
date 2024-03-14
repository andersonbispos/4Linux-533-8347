resource "aws_instance" "web" {
  ami           = "ami-0e0bf53f6def86294"
  instance_type = "t2.micro"

  #   associate_public_ip_address = true

  subnet_id = "subnet-026b698ae237de94c"

  vpc_security_group_ids = ["sg-079711cb02c0b71b2"]

  tags = {
    Name = "web2"
  }
}