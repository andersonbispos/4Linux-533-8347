terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }

}

provider "aws" {
  region = local.default_region

  default_tags {
    tags = local.common_tags
  }
}



