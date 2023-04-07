#####################################
### Azure-Stack vars.tf file
#####################################

variable "email" {}
variable "region" {}

variable "uat_web_vpc_name" {}
variable "uat_web_cidr_block" {}
variable "uat_app_vpc_name" {}
variable "uat_app_cidr_block" {}
variable "uat_db_vpc_name" {}
variable "uat_db_cidr_block" {}
variable "uat_services_vpc_name" {}
variable "uat_services_cidr_block" {}

variable "uat_web_pub_subnet1a_name" {}
variable "uat_web_pub_subnet1a_cidr_block" {}
variable "uat_web_pub_subnet1b_name" {}
variable "uat_web_pub_subnet1b_cidr_block" {}

variable "uat_web_pvt_subnet1a_name" {}
variable "uat_web_pvt_subnet1a_cidr_block" {}
variable "uat_web_pvt_subnet1b_name" {}
variable "uat_web_pvt_subnet1b_cidr_block" {}

variable "uat_app_pvt_subnet1a_name" {}
variable "uat_app_pvt_subnet1a_cidr_block" {}
variable "uat_app_pvt_subnet1b_name" {}
variable "uat_app_pvt_subnet1b_cidr_block" {}

variable "uat_db_pvt_subnet1a_name" {}
variable "uat_db_pvt_subnet1a_cidr_block" {}
variable "uat_db_pvt_subnet1b_name" {}
variable "uat_db_pvt_subnet1b_cidr_block" {}

variable "uat_jumphost_pub_subnet1a_name" {}
variable "uat_jumphost_pub_subnet1a_cidr_block" {}
# variable "uat_jumphost_pub_subnet1b_name" {}
# variable "uat_jumphost_pub_subnet1b_cidr_block" {}

variable "uat_proxy_pub_subnet1a_name" {}
variable "uat_proxy_pub_subnet1a_cidr_block" {}
# variable "uat_proxy_pub_subnet1b_name" {}
# variable "uat_proxy_pub_subnet1b_cidr_block" {}

variable "web_igw_name" {}
variable "services_igw_name" {}
variable "web_app_rtb_name" {}
variable "web_app_db_rtb_name" {}

variable "services_ngw_name" {}
variable "services_nat_eip_name" {}
variable "proxy_rtb_name" {}