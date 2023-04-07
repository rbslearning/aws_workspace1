module "web-vpc" {
  source     = "./modules/vpc"
  name       = "web-vpc"
  cidr_block = "10.1.0.0/21"
}

module "app-vpc" {
  source     = "./modules/vpc"
  name       = "app-vpc"
  cidr_block = "10.2.0.0/21"
}

module "db-vpc" {
  source     = "./modules/vpc"
  name       = "db-vpc"
  cidr_block = "10.3.0.0/21"
}

module "services-vpc" {
  source     = "./modules/vpc"
  name       = "services-vpc"
  cidr_block = "10.4.0.0/21"
}

module "web-dmz-subnet1a" {
  source            = "./modules/subnet"
  name              = "web-dmz-subnet1a"
  vpc_id            = module.web-vpc.id
  cidr_block        = "10.1.0.0/23"
  availability_zone = "ap-southeast-1a"
}

module "web-dmz-subnet1b" {
  source            = "./modules/subnet"
  name              = "web-dmz-subnet1b"
  vpc_id            = module.web-vpc.id
  cidr_block        = "10.1.2.0/23"
  availability_zone = "ap-southeast-1b"
}

module "web-private-subnet1a" {
  source            = "./modules/subnet"
  name              = "web-private-subnet1a"
  vpc_id            = module.web-vpc.id
  cidr_block        = "10.1.4.0/23"
  availability_zone = "ap-southeast-1a"
}

module "web-private-subnet1b" {
  source            = "./modules/subnet"
  name              = "web-private-subnet1b"
  vpc_id            = module.web-vpc.id
  cidr_block        = "10.1.6.0/23"
  availability_zone = "ap-southeast-1b"
}

module "app-subnet1a" {
  source            = "./modules/subnet"
  name              = "app-subnet1a"
  vpc_id            = module.web-vpc.id
  cidr_block        = "10.2.0.0/23"
  availability_zone = "ap-southeast-1a"
}

module "app-subnet1b" {
  source            = "./modules/subnet"
  name              = "app-subnet1b"
  vpc_id            = module.web-vpc.id
  cidr_block        = "10.2.2.0/23"
  availability_zone = "ap-southeast-1b"
}

module "vpc-peering" {
  source      = "./modules/vpc-peering"
  vpc_id      = module.web-vpc.id
  peer_vpc_id = module.app-vpc.id
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