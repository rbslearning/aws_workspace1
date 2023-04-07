variable "name" {}
variable "vpc_id" {}

resource "aws_internet_gateway" "default" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.name}"
  }
}

output "id" {
  value = aws_internet_gateway.default.id
}
