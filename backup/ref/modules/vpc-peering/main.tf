variable "vpc_id" {}
variable "peer_vpc_id" {}

resource "aws_vpc_peering_connection" "default" {
  peer_vpc_id = var.peer_vpc_id
  vpc_id      = var.vpc_id
  auto_accept = true
  tags = {
    Name = "Custom Peering"
  }
}

output "id" {
  value = aws_vpc_peering_connection.default.id
}
