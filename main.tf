terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.86.0"
    }
  }
  
  backend "s3" {
    bucket = "cursoterraform-kubernets"
    key    = "terraform-aws-versioning/terraform.tfstate"
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