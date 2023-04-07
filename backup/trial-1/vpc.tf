###############################################
### AWS-Stack vpc.tf file
###############################################

# provider "aws" {
#   #version = "~> 2.0"
#   region  = var.region
#   #region  = "ap-southeast-1"
#   #   shared_credentials_file = "~/.aws/rootkey.csv"
# }

module "rbs_uat_web_vpc" {
  source             = "./modules/vpc"
  uat_web_vpc_name   = var.uat_web_vpc_name
  uat_web_cidr_block = var.uat_web_cidr_block
  email              = var.email
  #region             = var.region
}
