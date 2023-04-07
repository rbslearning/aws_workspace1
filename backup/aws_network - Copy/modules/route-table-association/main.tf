variable "subnet_id" {}
variable "route_table_id" {}


resource "aws_route_table_association" "default" {
  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
}