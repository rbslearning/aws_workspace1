variable "name" {}

resource "aws_eip" "default" {
  #   instance = "${aws_instance.web.id}"
  #   vpc      = true
  tags = {
    Name = var.name
  }
}

output "id" {
  value = aws_eip.default.id
}
output "public_ip" {
  value = aws_eip.default.public_ip
}