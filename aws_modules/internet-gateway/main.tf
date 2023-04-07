variable "name" {}
variable "vpc_id" {}
variable "email" {}

resource "aws_internet_gateway" "default" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.name
    email=var.email
  }
}

output "id" {
  value = aws_internet_gateway.default.id
}
