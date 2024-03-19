locals {
  vpcid = "vpc-07b288829dc3cffa1"
  default_zone = "us-east-2c"
  default_region = "us-east-2"

  common_tags = {
    Environment = "lab-4linux"
    terraform   = "yes"
    aula        = "Aula04"
  }
}
