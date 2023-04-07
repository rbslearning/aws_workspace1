module "rbs_deploy_bucket" {
  source = "../aws_modules/s3"
  #bucket name should be unique
  name  = var.name
  email = var.email
}