resource "aws_instance" "web1" {
  ami           = "ami-08af887b5731562d3"
  instance_type = "t3.micro"

  subnet_id = aws_subnet.subnet1.id

  vpc_security_group_ids = [aws_security_group.allow_default_ports.id]

  user_data = base64encode("#!/bin/bash\n sudo apt update; sudo apt install nginx -y")

  tags = {
    Name = "web1"
  }

  depends_on = [aws_instance.dbserver1]
}

resource "aws_instance" "web2" {
  ami           = "ami-08af887b5731562d3"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.subnet2.id

  vpc_security_group_ids = [aws_security_group.allow_default_ports.id]

  user_data = base64encode("#!/bin/bash\n sudo apt update; sudo apt install nginx -y")

  tags = {
    Name = "web1"
  }

  depends_on = [aws_instance.dbserver1]
}
