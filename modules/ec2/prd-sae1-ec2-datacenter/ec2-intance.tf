resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                         = "ami-0e2c8caa4b6378d8c"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = "subnet-00b0a44763c68a7b7"
  vpc_security_group_ids      = [aws_security_group.security_group.id]
  associate_public_ip_address = true



  tags = {
    Name = "${var.ec2_name_instance}"
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

