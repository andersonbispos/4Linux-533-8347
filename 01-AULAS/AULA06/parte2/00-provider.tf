terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }

  # backend "s3" {
  #   bucket         = "trfm-state-bucket-abs"
  #   key            = "terraform-state/lab/terraform.tfstate"
  #   region         = "us-east-2"
  #   dynamodb_table = "terraform-lock"
  #   #access_key = ""
  #   #secret_key = ""
  # }

}

provider "aws" {
  # Configuration options
  region = local.default_region

  default_tags {
    # tags = {
    #   Environment = "lab-4linux"
    #   terraform   = "yes"
    #   aula        = "Aula04"
    # }

    tags = local.common_tags
  }
}



