variable "resource_name" {
  default     = "prd-sae1-vpc-services"
  type        = string
  description = "Nome do Recurso a ser criado"
}

variable "resource_name_id" {
  default     = "1b"
  type        = string
  description = "Nome do Recurso a ser criado"
}

variable "cidr_block" {
  type        = string
  description = "Network de cidr_block dinamic to be used for the vpc"
  default     = "10.0.4.0/22"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}


