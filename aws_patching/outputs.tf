
output "ec2_iam_role" {
  value = aws_iam_role.rbs_tf_role.name
}
output "ec2_iam_profile" {
  value = aws_iam_instance_profile.rbs_tf_role_profile.name
}

