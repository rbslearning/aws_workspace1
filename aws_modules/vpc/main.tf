variable "cidr_block" {}
variable "name" {}
variable "email" {}


resource "aws_vpc" "default" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
    Name  = var.name
    email = var.email
  }
}


output "arn" {
  value = aws_vpc.default.arn
}

output "id" {
  value = aws_vpc.default.id
}

output "default_route_table_id" {
  value = aws_vpc.default.default_route_table_id
}
