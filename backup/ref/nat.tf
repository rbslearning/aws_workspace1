module "sales-eip" {
  source = "./modules/eip"
  name   = "sales-eip"
}

module "sales-nat-gateway" {
  source        = "./modules/nat-gateway"
  name          = "sales-nat-gateway"
  allocation_id = module.sales-eip.id
  subnet_id     = module.sales-subnet-internet.id
}

module "sales-to-natgw" {
  source = "./modules/route"
  # route_table_id = "rtb-0157970ac3f4036ed"
  route_table_id         = module.sales-vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  #   vpc_peering_connection_id = null
  #   gateway_id = module.intenet-gateway-sales.id
  nat_gateway_id = module.sales-nat-gateway.id
}

module "internet-route-table" {
  source = "./modules/route-table"
  name   = "internet-route-table"
  vpc_id = module.sales-vpc.id
}

module "natgw-to-intgw" {
  source = "./modules/route"
  # route_table_id = "rtb-0157970ac3f4036ed"
  route_table_id         = module.internet-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  #   vpc_peering_connection_id = null
  gateway_id = module.intenet-gateway-sales.id
}

module "route-table-to-subnet" {
  source         = "./modules/route-table-association"
  subnet_id      = module.sales-subnet-internet.id
  route_table_id = module.internet-route-table.id
}
