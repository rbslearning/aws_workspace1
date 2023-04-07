module "vpc-peering" {
  source      = "./modules/vpc-peering"
  vpc_id      = "vpc-4cc2dd2b" # default
  peer_vpc_id = module.sales-vpc.id
}

module "default-sales" {
  source                    = "./modules/route"
  route_table_id            = "rtb-57ef8c31"
  destination_cidr_block    = "192.168.0.0/24"
  vpc_peering_connection_id = module.vpc-peering.id
  gateway_id                = null
}

module "sales-default" {
  source                    = "./modules/route"
  route_table_id            = module.sales-vpc.default_route_table_id
  destination_cidr_block    = "172.31.0.0/16"
  vpc_peering_connection_id = module.vpc-peering.id
  gateway_id                = null
}