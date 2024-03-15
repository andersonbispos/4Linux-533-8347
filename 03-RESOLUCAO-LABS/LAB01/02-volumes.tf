resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1c"
  size              = 10
  type              = "gp3"

  tags = {
    Name = "web-data"
  }
}