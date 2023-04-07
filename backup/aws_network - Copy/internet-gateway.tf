module "intenet-gateway-web" {
  source = "./modules/internet-gateway"
  name   = var.web_igw_name
  vpc_id = module.web-vpc.id
  email  = var.email
}

module "intenet-gateway-services" {
  source = "./modules/internet-gateway"
  name   = var.services_igw_name
  vpc_id = module.services-vpc.id
  email  = var.email
}