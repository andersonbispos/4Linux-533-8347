terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-2"

  default_tags {
    tags = {
      Environment = "lab-4linux"
      terraform   = "yes"
      aula        = "Aula04"
    }
  }
}



