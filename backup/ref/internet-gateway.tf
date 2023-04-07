module "intenet-gateway-sales" {
  source = "./modules/internet-gateway"
  name   = "sales-internet-gateway"
  vpc_id = module.sales-vpc.id
}