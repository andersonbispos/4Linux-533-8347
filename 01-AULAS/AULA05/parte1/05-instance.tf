resource "aws_instance" "web" {
  ami           = "ami-0e0bf53f6def86294"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.subnet_public_2a.id

  vpc_security_group_ids = [ aws_security_group.sg_default.id ]

  user_data = base64encode("#!/bin/bash\n sudo yum install nginx -y; sudo systemctl enable nginx; sudo systemctl start nginx")

  tags = {
    Name = "web2"
  }
}