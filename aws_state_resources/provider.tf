terraform {
  backend "local" {}
}

# Configure the AWS Provider
provider "aws" {
  #version = "~> 2.0"
  region = var.region
  #   shared_credentials_file = "~/.aws/rootkey.csv"
}



# terraform {
#   required_version = ">= 0.13.1"

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = ">= 4.9"
#     }
#     random = {
#       source  = "hashicorp/random"
#       version = ">= 2.0"
#     }
#   }
# }