module "services-nat-eip" {
  source = "../aws_modules/eip"
  name   = var.services_nat_eip_name
  email  = var.email
}

module "services-nat-gateway" {
  source        = "../aws_modules/nat-gateway"
  name          = var.services_ngw_name
  allocation_id = module.services-nat-eip.id
  #subnet_id     = module.proxy-subnet1a.id
  subnet_id     = module.jumphost-subnet1a.id
  email         = var.email
}

# module "sales-to-natgw" {
#   source = "../aws_modules/route"
#   # route_table_id = "rtb-0157970ac3f4036ed"
#   route_table_id         = module.sales-vpc.default_route_table_id
#   destination_cidr_block = "0.0.0.0/0"
#   #   vpc_peering_connection_id = null
#   #   gateway_id = module.intenet-gateway-sales.id
#   nat_gateway_id = module.sales-nat-gateway.id
# }

# module "internet-route-table" {
#   source = "../aws_modules/route-table"
#   name   = "internet-route-table"
#   vpc_id = module.sales-vpc.id
# }

# module "natgw-to-intgw" {
#   source = "../aws_modules/route"
#   # route_table_id = "rtb-0157970ac3f4036ed"
#   route_table_id         = module.internet-route-table.id
#   destination_cidr_block = "0.0.0.0/0"
#   #   vpc_peering_connection_id = null
#   gateway_id = module.intenet-gateway-sales.id
# }

# module "route-table-to-subnet" {
#   source         = "../aws_modules/route-table-association"
#   subnet_id      = module.sales-subnet-internet.id
#   route_table_id = module.internet-route-table.id
# }
