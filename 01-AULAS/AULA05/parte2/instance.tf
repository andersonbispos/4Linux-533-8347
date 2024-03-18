resource "aws_instance" "web" {
  ami = "ami-0e0bf53f6def86294"

  availability_zone = "us-east-2b"
  instance_type     = "t2.micro"
  subnet_id         = "subnet-0ae37c3e603c653c9"

  vpc_security_group_ids = [aws_security_group.sg_instance_default.id]

  tags = {
    "Name" = "web2"
  }

  tags_all = {
    "Environment" = "lab-4linux"
    "Name"        = "web2"
    "aula"        = "Aula04"
    "terraform"   = "yes"
  }
}