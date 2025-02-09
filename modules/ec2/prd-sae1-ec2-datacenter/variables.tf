variable "ec2_name_instance" {
  type        = string
  description = "Nome da Instancia virtual"
  default     = "prd-sae1-ec2-datacenter"
}

variable "ec2_name_instance_id" {
  type        = string
  description = "Nome da Instancia virtual"
  default     = "ec2-datacenter"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}



