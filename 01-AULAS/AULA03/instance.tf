resource "aws_instance" "web" {
  ami           = "ami-0e0bf53f6def86294"
  instance_type = "t2.micro"

  availability_zone = "us-east-2b"

  tags = {
    Name = "web2"
  }
}