resource "aws_ec2_managed_prefix_list" "escritorio" {
  name           = "All escritorio acessos"
  address_family = "IPv4"
  max_entries    = 5

  tags = {
    Env = "live"
  }
}

resource "aws_ec2_managed_prefix_list_entry" "escritorio1" {
  cidr           = "192.168.25.0/24"
  description    = "Escopo Matrix"
  prefix_list_id = aws_ec2_managed_prefix_list.escritorio.id
}

resource "aws_ec2_managed_prefix_list_entry" "escritorio2" {
  cidr           = "192.168.22.120/32"
  description    = "Firewall"
  prefix_list_id = aws_ec2_managed_prefix_list.escritorio.id
}

