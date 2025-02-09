terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.86.0"
    }
  }
  
  backend "s3" {
    bucket = "terraform-aws-versioning"
    key    = "vpc_save_state/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "rfgiacomini"
      managed-by = "terraform"
    }
  }
}

