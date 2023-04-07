variable "vpc_id" {}
variable "name" {}
variable "email" {}


resource "aws_route_table" "default" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.name
    email = var.email
  }
}

output "id" {
  value = aws_route_table.default.id
}
