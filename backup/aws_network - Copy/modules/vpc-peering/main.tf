resource "aws_vpc_peering_connection" "default" {
  vpc_id      = var.vpc_id
  peer_vpc_id = var.peer_vpc_id
  auto_accept = true
  tags = {
    Name = var.name
    email = var.email
  }
}