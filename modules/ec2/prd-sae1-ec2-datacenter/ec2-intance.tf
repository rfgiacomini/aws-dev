resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                         = "ami-0e2c8caa4b6378d8c"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = "subnet-0ab92fc4e088799ed"
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

