variable "name" {}
variable "email" {}

# variable "acl_value" {
#     default = "private"
# }

resource "aws_s3_bucket" "default" {
    bucket  = var.name
    # acl     = var.acl_value 

    tags = {
    Name        = var.name
    email       = var.email
  }      
}

resource "aws_s3_bucket_acl" "default" {
  bucket = aws_s3_bucket.default.id
  acl    = "private"
}