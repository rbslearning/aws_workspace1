# ###############################################
# ### AWS-Stack provider.tf file
# ###############################################

# # terraform {
# #   backend "local" {}
# # }

# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 2.0"
#     }
#   }
# }

# Configure the AWS Provider
provider "aws" {
  #version = "~> 2.0"
  region = var.region
  #region  = "ap-southeast-1"
  #   shared_credentials_file = "~/.aws/rootkey.csv"
}