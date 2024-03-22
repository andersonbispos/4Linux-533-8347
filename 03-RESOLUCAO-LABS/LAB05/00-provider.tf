terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }

}

provider "aws" {
  region = var.ambientes[terraform.workspace]

  default_tags {
    tags = local.common_tags
  }
}



