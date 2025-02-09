module "bucket_s3" {
  source = "./modules/s3"
}
module "prd-sae1-vpc-services-1a" {
  source = "./modules/network/prd-sae1-vpc-services-1a"
  tags   = local.tags
}

