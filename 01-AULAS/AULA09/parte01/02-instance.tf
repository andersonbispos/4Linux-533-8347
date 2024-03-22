resource "aws_instance" "web" {

  ami           = data.aws_ami.ami_amazon_linux.id
  
  instance_type = "t2.micro"

  availability_zone = "us-east-2b"

  tags = {
    Name = "web2"
  }
}