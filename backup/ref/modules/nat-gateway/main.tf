variable "allocation_id" {}
variable "subnet_id" {}
variable "name" {}


resource "aws_nat_gateway" "default" {
  allocation_id = var.allocation_id
  subnet_id     = var.subnet_id

  tags = {
    Name = "${var.name}"
  }
}

output "id" {
  value = aws_nat_gateway.default.id
}
