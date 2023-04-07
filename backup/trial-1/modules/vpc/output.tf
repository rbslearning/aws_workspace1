###############################################
### AWS-Stack "vpc module" output.tf file
###############################################

output "arn" {
  value = aws_vpc.rbs_uat_web_vpc.arn
}

output "id" {
  value = aws_vpc.rbs_uat_web_vpc.id
}

output "default_route_table_id" {
  value = aws_vpc.rbs_uat_web_vpc.default_route_table_id
}