resource "aws_internet_gateway" "aws_igw" {
  vpc_id = aws_vpc.aws_vpc.id
  tags = merge(
    var.tags,
    {
      Name = "${var.resource_name}-internet-gateway-${var.resource_name_id}",
    }
  )
}

resource "aws_route_table" "aws-rta" {
  vpc_id = aws_vpc.aws_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_igw.id
  }
  tags = merge(
    var.tags,
    {
      Name = "${var.resource_name}-private-route-table-${var.resource_name_id}",
    }
  )

}

resource "aws_route_table_association" "prd-sae1-association-rta" {
  subnet_id      = aws_subnet.aws_subnet.id
  route_table_id = aws_route_table.aws-rta.id
}

