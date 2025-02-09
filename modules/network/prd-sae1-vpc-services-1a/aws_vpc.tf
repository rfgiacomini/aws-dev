resource "aws_vpc" "aws_name_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.tags,
    {
      Name = "${var.resource_name}-${var.resource_name_id}"
    }
  )
}

resource "aws_subnet" "aws_subnet" {
  vpc_id                  = aws_vpc.aws_name_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 6, 2)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = false
  tags = merge(
    var.tags,
    {
      Name = "${var.resource_name}-subnet-${var.resource_name_id}",

    }
  )
}
