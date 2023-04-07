# output "aws-iam-instance-profile" {
#   value = module.jumphost.public_ip
# }

output "db_endpoint_address" {
  value = aws_db_instance.rds_postgres.address
}