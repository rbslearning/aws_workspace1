variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "vpc_security_group_ids" {
  type = list(any)
}
variable "name" {}
variable "user_data" {
  default = null
}
# variable "get_password_data" {
#   type = bool
# }
variable "volume_type" {}
variable "associate_public_ip_address" {
  type = bool
}
variable "subnet_id" {}
variable "email" {}


resource "aws_instance" "default" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  user_data = var.user_data
  subnet_id                   = var.subnet_id
  root_block_device {
    volume_type = var.volume_type
  }
  tags = {
    Name = var.name
    email = var.email
  }
}

output "public_ip" {
  value = aws_instance.default.public_ip
}

output "proxy_dns" {
  value = aws_instance.default.private_dns
}
