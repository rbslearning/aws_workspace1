variable "vpc_id" {}
variable "name" {}



resource "aws_route_table" "default" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.name
  }
}

output "id" {
  value = aws_route_table.default.id
}
