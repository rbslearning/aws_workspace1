###############################################
### AWS-Stack "vpc module" main.tf file
###############################################

resource "aws_vpc" "rbs_uat_web_vpc" {
  cidr_block           = var.uat_web_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    #Name = "${var.name}"
    Name  = "${var.uat_web_vpc_name}"
    email = "${var.email}"
  }
}