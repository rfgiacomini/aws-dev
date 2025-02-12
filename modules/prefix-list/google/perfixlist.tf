resource "aws_ec2_managed_prefix_list" "google" {
  name           = "All VPC CIDR-s"
  address_family = "IPv4"
  max_entries    = 5

  tags = {
    Env = "live"
  }
}

resource "aws_ec2_managed_prefix_list_entry" "google-ip1" {
  cidr           = "192.168.32.1/32"
  description    = "Primary Google"
  prefix_list_id = aws_ec2_managed_prefix_list.google.id
}

resource "aws_ec2_managed_prefix_list_entry" "google-ip2" {
  cidr           = "192.168.32.2/32"
  description    = "Primary Google"
  prefix_list_id = aws_ec2_managed_prefix_list.google.id
}
