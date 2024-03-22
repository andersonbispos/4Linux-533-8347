resource "aws_instance" "web" {

  ami           = data.aws_ami.ami_amazon_linux.id

  instance_type = "t2.micro"

  tags = {
    Name = "web-${terraform.workspace}"
  }
}