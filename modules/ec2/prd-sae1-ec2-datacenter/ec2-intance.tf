resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                         = "ami-0e2c8caa4b6378d8c"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.aws_subnet_1a.id
  vpc_security_group_ids      = [aws_security_group.security_group.id]
  associate_public_ip_address = true



  tags = {
    Name = "${var.ec2_name_instance}"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "aws-dev-modules"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

module "prd-sae1-vpc-services-1a" {
  source = "../../network/prd-sae1-vpc-services-1a"
  # Outros parâmetros do módulo VPC
  tags = {
    Name        = "prd-sae1-vpc"
    Environment = "Dev"
  }
}

