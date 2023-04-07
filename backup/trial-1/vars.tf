###############################################
### AWS-Stack vars.tf file
###############################################

variable "uat_web_cidr_block" {}
variable "uat_web_vpc_name" {}
variable "email" {}
# variable "aws_availability_zones" {
#   default = {
#     //  Singapore
#     ap-southeast-1 = [
#       "ap-southeast-1a",
#       "ap-southeast-1b",
#     ]
#   }
# }
variable "region" {}