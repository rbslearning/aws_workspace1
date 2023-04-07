variable "vpc_id" {}
variable "cidr_block" {}
variable "availability_zone" {}
variable "name" {}


resource "aws_subnet" "default" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

  tags = {
    Name = "${var.name}"
  }
}

output "id" {
  value = aws_subnet.default.id
}
output "arn" {
  value = aws_subnet.default.arn
}