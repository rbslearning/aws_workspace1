module "web-vpc" {
  source     = "../aws_modules/vpc"
  name       = var.uat_web_vpc_name
  email      = var.email
  cidr_block = var.uat_web_cidr_block
}

module "app-vpc" {
  source     = "../aws_modules/vpc"
  name       = var.uat_app_vpc_name
  email      = var.email
  cidr_block = var.uat_app_cidr_block
}

module "db-vpc" {
  source     = "../aws_modules/vpc"
  name       = var.uat_db_vpc_name
  email      = var.email
  cidr_block = var.uat_db_cidr_block
}

module "services-vpc" {
  source     = "../aws_modules/vpc"
  name       = var.uat_services_vpc_name
  email      = var.email
  cidr_block = var.uat_services_cidr_block
}

# module "db-vpc" {
#   source     = "../aws_modules/vpc"
#   name       = "db-vpc"
#   cidr_block = "10.3.0.0/16"
# }

# module "services-vpc" {
#   source     = "../aws_modules/vpc"
#   name       = "services-vpc"
#   cidr_block = "10.4.0.0/16"
# }

