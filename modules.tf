module "prd-sae1-vpc-services-1a" {
  source = "./modules/network/prd-sae1-vpc-services-1a"
  tags   = local.tags
}
module "prd-sae1-ec2-datacenter" {
  source = "./modules/ec2/prd-sae1-ec2-datacenter"
  tags   = local.tags
}