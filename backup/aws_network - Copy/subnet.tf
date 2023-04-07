
module "web-dmz-subnet1a" {
  source            = "./modules/subnet"
  name              = var.uat_web_pub_subnet1a_name
  vpc_id            = module.web-vpc.id
  cidr_block        = var.uat_web_pub_subnet1a_cidr_block
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  email             = var.email
}

module "web-dmz-subnet1b" {
  source            = "./modules/subnet"
  name              = var.uat_web_pub_subnet1b_name
  vpc_id            = module.web-vpc.id
  cidr_block        = var.uat_web_pub_subnet1b_cidr_block
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  email             = var.email
}

module "web-private-subnet1a" {
  source            = "./modules/subnet"
  name              = var.uat_web_pvt_subnet1a_name
  vpc_id            = module.web-vpc.id
  cidr_block        = var.uat_web_pvt_subnet1a_cidr_block
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  email             = var.email
}

module "web-private-subnet1b" {
  source            = "./modules/subnet"
  name              = var.uat_web_pvt_subnet1b_name
  vpc_id            = module.web-vpc.id
  cidr_block        = var.uat_web_pvt_subnet1b_cidr_block
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  email             = var.email
}

module "app-subnet1a" {
  source            = "./modules/subnet"
  name              = var.uat_app_pvt_subnet1a_name
  vpc_id            = module.app-vpc.id
  cidr_block        = var.uat_app_pvt_subnet1a_cidr_block
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  email             = var.email
}

module "app-subnet1b" {
  source            = "./modules/subnet"
  name              = var.uat_app_pvt_subnet1b_name
  vpc_id            = module.app-vpc.id
  cidr_block        = var.uat_app_pvt_subnet1b_cidr_block
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  email             = var.email
}

module "db-subnet1a" {
  source            = "./modules/subnet"
  name              = var.uat_db_pvt_subnet1a_name
  vpc_id            = module.db-vpc.id
  cidr_block        = var.uat_db_pvt_subnet1a_cidr_block
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  email             = var.email
}

module "db-subnet1b" {
  source            = "./modules/subnet"
  name              = var.uat_db_pvt_subnet1b_name
  vpc_id            = module.db-vpc.id
  cidr_block        = var.uat_db_pvt_subnet1b_cidr_block
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  email             = var.email
}

module "jumphost-subnet1a" {
  source            = "./modules/subnet"
  name              = var.uat_jumphost_pub_subnet1a_name
  vpc_id            = module.services-vpc.id
  cidr_block        = var.uat_jumphost_pub_subnet1a_cidr_block
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  email             = var.email
}

module "proxy-subnet1a" {
  source            = "./modules/subnet"
  name              = var.uat_proxy_pub_subnet1a_name
  vpc_id            = module.services-vpc.id
  cidr_block        = var.uat_proxy_pub_subnet1a_cidr_block
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  email             = var.email
}


# module "jumphost-subnet1b" {
#   source            = "./modules/subnet"
#   name              = var.uat_jumphost_pub_subnet1b_name
#   vpc_id            = module.services-vpc.id
#   cidr_block        = var.uat_jumphost_pub_subnet1b_cidr_block
#   availability_zone = data.aws_availability_zones.available_zones.names[1]
#   email             = var.email
# }

# module "proxy-subnet1b" {
#   source            = "./modules/subnet"
#   name              = var.uat_proxy_pub_subnet1b_name
#   vpc_id            = module.services-vpc.id
#   cidr_block        = var.uat_proxy_pub_subnet1b_cidr_block
#   availability_zone = data.aws_availability_zones.available_zones.names[1]
#   email             = var.email
# }