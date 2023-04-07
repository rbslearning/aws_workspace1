module "vpc-peering" {
  source      = "./modules/vpc-peering"
  vpc_id      = module.web-vpc.id
  peer_vpc_id = module.app-vpc.id
  name        = format("peering-%s-%s", var.uat_web_vpc_name, var.uat_app_vpc_name)
  email       = var.email
}

module "web-default" {
  source                 = "./modules/route"
  route_table_id         = module.web-vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.intenet-gateway-web.id
}

module "web-app-rtb" {
  source = "./modules/route-table"
  vpc_id = module.web-vpc.id
  name   = var.web_app_rtb_name
  email  = var.email
}

module "web-app-route" {
  source                    = "./modules/route"
  route_table_id            = module.web-app-rtb.id
  destination_cidr_block    = var.uat_app_cidr_block
  vpc_peering_connection_id = module.vpc-peering.id
  gateway_id                = null
}

module "web-app-subnet1a" {
  source         = "./modules/route-table-association"
  subnet_id      = module.web-private-subnet1a.id
  route_table_id = module.web-app-rtb.id
}

module "web-app-subnet1b" {
  source         = "./modules/route-table-association"
  subnet_id      = module.web-private-subnet1b.id
  route_table_id = module.web-app-rtb.id
}



################# App DB Peering ##################

module "app-db-vpc-peering" {
  source      = "./modules/vpc-peering"
  vpc_id      = module.app-vpc.id
  peer_vpc_id = module.db-vpc.id
  name        = format("peering-%s-%s", var.uat_app_vpc_name, var.uat_db_vpc_name)
  email       = var.email
}

module "web-app-db-rtb" {
  source = "./modules/route-table"
  vpc_id = module.app-vpc.id
  name   = var.web_app_db_rtb_name
  email  = var.email
}

module "app-web-route" {
  source                    = "./modules/route"
  route_table_id            = module.web-app-db-rtb.id
  destination_cidr_block    = var.uat_web_cidr_block
  vpc_peering_connection_id = module.vpc-peering.id
  gateway_id                = null
}

module "app-db-route" {
  source                    = "./modules/route"
  route_table_id            = module.web-app-db-rtb.id
  destination_cidr_block    = var.uat_db_cidr_block
  vpc_peering_connection_id = module.app-db-vpc-peering.id
  gateway_id                = null
}

module "app-services-route" {
  source                    = "./modules/route"
  route_table_id            = module.web-app-db-rtb.id
  destination_cidr_block    = var.uat_services_cidr_block
  vpc_peering_connection_id = module.app-services-vpc-peering.id
  gateway_id                = null
}

module "app-subnet1a-association" {
  source         = "./modules/route-table-association"
  subnet_id      = module.app-subnet1a.id
  route_table_id = module.web-app-db-rtb.id
}

module "app-subnet1b-association" {
  source         = "./modules/route-table-association"
  subnet_id      = module.app-subnet1b.id
  route_table_id = module.web-app-db-rtb.id
}



################# Web Service Peering ##################

module "web-services-vpc-peering" {
  source      = "./modules/vpc-peering"
  vpc_id      = module.web-vpc.id
  peer_vpc_id = module.services-vpc.id
  name        = format("peering-%s-%s", var.uat_web_vpc_name, var.uat_services_vpc_name)
  email       = var.email
}


################# App Service Peering ##################

module "app-services-vpc-peering" {
  source      = "./modules/vpc-peering"
  vpc_id      = module.app-vpc.id
  peer_vpc_id = module.services-vpc.id
  name        = format("peering-%s-%s", var.uat_app_vpc_name, var.uat_services_vpc_name)
  email       = var.email
}


################# Service routes ##################

module "services-default" {
  source                 = "./modules/route"
  route_table_id         = module.services-vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.intenet-gateway-services.id
}

module "services-web-route" {
  source                    = "./modules/route"
  route_table_id            = module.services-vpc.default_route_table_id
  destination_cidr_block    = var.uat_web_cidr_block
  vpc_peering_connection_id = module.web-services-vpc-peering.id
  gateway_id                = null
}

module "services-app-route" {
  source                    = "./modules/route"
  route_table_id            = module.services-vpc.default_route_table_id
  destination_cidr_block    = var.uat_app_cidr_block
  vpc_peering_connection_id = module.app-services-vpc-peering.id
  gateway_id                = null
}

module "jumphost-subnet1a-association" {
  source         = "./modules/route-table-association"
  subnet_id      = module.jumphost-subnet1a.id
  route_table_id = module.services-vpc.default_route_table_id
}


module "proxy-rtb" {
  source = "./modules/route-table"
  vpc_id = module.services-vpc.id
  name   = var.proxy_rtb_name
  email  = var.email
}

module "services-nat" {
  source                 = "./modules/route"
  route_table_id         = module.proxy-rtb.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id             = module.services-nat-gateway.id
}

module "proxy-web-route" {
  source                    = "./modules/route"
  route_table_id            = module.proxy-rtb.id
  destination_cidr_block    = var.uat_web_cidr_block
  vpc_peering_connection_id = module.web-services-vpc-peering.id
  gateway_id                = null
}

module "proxy-app-route" {
  source                    = "./modules/route"
  route_table_id            = module.proxy-rtb.id
  destination_cidr_block    = var.uat_app_cidr_block
  vpc_peering_connection_id = module.app-services-vpc-peering.id
  gateway_id                = null
}

module "proxy-subnet1a-association" {
  source         = "./modules/route-table-association"
  subnet_id      = module.proxy-subnet1a.id
  route_table_id = module.proxy-rtb.id
}