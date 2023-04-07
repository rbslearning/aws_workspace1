# variable "cidr_block" {}
# variable "name" {}

resource "aws_vpc" "default" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "${var.name}"
  }
}


# output "arn" {
#   value = aws_vpc.default.arn
# }

# output "id" {
#   value = aws_vpc.default.id
# }

# output "default_route_table_id" {
#   value = aws_vpc.default.default_route_table_id
# }
