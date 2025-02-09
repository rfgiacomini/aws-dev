variable "ec2_name_instance" {
  type        = string
  description = "Nome da Instancia virtual"
  default     = "prd-sae1"
}

variable "ec2_name_instance_id" {
  type        = string
  description = "Nome da Instancia virtual"
  default     = "ec2-datacenter"
}

variable "Ec2_vpc_id" {
  type        = string
  description = "ID da subnet Instancia virtual"
  default     = "vpc-077d40db0031fa863"
}

variable "Ec2_subnet_id" {
  type        = string
  description = "ID da subnet Instancia virtual"
  default     = "subnet-0b541a6858de0722e"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}


