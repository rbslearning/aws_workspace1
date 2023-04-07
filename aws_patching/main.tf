
###############################################################################################
## Createing IAM role
###############################################################################################

#Create an IAM Role
resource "aws_iam_role" "rbs_tf_role" {
  name = var.name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "RoleForEC2"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = var.name
    email = var.email
  }
}

# # Attach the Policy to the created IAM role
# # resource "aws_iam_role_policy_attachment" "rbs_tf_role_attach" {
# resource "aws_iam_policy_attachment" "rbs_tf_role_attach" {
#   name       = "rbs-tf-role-attachment"
#   roles      = [aws_iam_role.rbs_tf_role.name]
#   policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
#   # policy_arn = aws_iam_policy.demo-s3-policy.arn
# }


resource "aws_iam_role_policy_attachment" "role-policy-attachment" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess", 
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonSSMFullAccess",
    "arn:aws:iam::aws:policy/AmazonSSMDirectoryServiceAccess",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AmazonSSMAutomationApproverAccess",
    "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM",
    "arn:aws:iam::aws:policy/service-role/AmazonSSMAutomationRole",
    "arn:aws:iam::aws:policy/service-role/AmazonSSMMaintenanceWindowRole",
    "arn:aws:iam::aws:policy/AmazonSSMPatchAssociation"
  ])

  role       = aws_iam_role.rbs_tf_role.name #var.iam_role_name
  policy_arn = each.value
}


# Create an instance profile using role
resource "aws_iam_instance_profile" "rbs_tf_role_profile" {
  name = "rbs-tf-ec2-role-profile"
  role = aws_iam_role.rbs_tf_role.name

  tags = {
    Name = var.name
    email = var.email
  }
}
