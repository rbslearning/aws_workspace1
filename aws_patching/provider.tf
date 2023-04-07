terraform {
  backend "s3" {
    bucket    = "rbs-deployment-bucket"
    key       = "iam_role/iam_role.tfstate"
    region    = "ap-southeast-1"
    profile   = "default"
  }
}


# Configure the AWS Provider
provider "aws" {
  region = var.region
}
