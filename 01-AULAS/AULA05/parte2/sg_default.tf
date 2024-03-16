# __generated__ by Terraform from "sg-05beb64de35bfa2c2"
resource "aws_security_group" "sg_instance_default" {
  name                   = "sg_libera_ping"
  vpc_id                 = "vpc-0ee67af9321c2aacd"
  description = "sg-libera-ping"

  ingress  {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = -1
    protocol         = "icmp"
    to_port          = -1
  }

  egress  {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    protocol         = "-1"
    to_port          = 0
  }
}