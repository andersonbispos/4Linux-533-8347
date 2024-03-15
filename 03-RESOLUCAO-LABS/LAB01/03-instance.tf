# resource "aws_instance" "vm1" {
#   ami           = "ami-07d9b9ddc6cd8dd30" # <- ubuntu 22.04 - us-east-1
#   instance_type = "t2.micro"

#   tags = {
#     Name = "vm1"
#   }
# }

resource "aws_instance" "vm1" {
  ami           = "ami-07d9b9ddc6cd8dd30" # <- ubuntu 22.04 - us-east-1
  instance_type = "t2.micro"

  vpc_security_group_ids = ["sg-034a598427077b022"]

  tags = {
    Name = "vm1"
  }
}