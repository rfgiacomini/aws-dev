terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.86.0"
    }
  }
  
  backend "s3" {
    bucket = "terraform-aws-versioning"
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

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-aws-versioning"
    key    = "terraform-aws-versioning/terraform.tfstate"
    region = "us-east-1"
  }
}
