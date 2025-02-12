resource "aws_security_group" "security_group" {
  name        = "${var.ec2_name_instance}-security_group-${var.ec2_name_instance_id}"
  description = "Permitir acesso na porta 22"
  vpc_id      = data.terraform_remote_state.vpc.outputs.aws_vpc_1a
  depends_on  = [module.prd-sae1-vpc-services-1a.aws_vpc]

  ingress {
    description     = "Allow google ips SSH"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    prefix_list_ids = [module.aws_profixlist_google.aws_profixlist_google]
  }

  ingress {
    description     = "Allow escritorio ips SSH"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    prefix_list_ids = [module.aws_profixlist_escritorio.aws_profixlist_escritorio]
  }

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.ec2_name_instance}-security_group-${var.ec2_name_instance_id}"
  }
}