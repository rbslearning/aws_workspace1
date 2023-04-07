module "webelb-security-group" {
  source      = "../aws_modules/security-group"
  name        = "webelb-security-group"
  email       = var.email
  description = "Allow ALB to access"
  vpc_id = data.terraform_remote_state.network.outputs.web-vpc-id
  ingress_rules = [
    {
      description = "Allow all private IPs"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow all private IPs"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      description = "Traffic to Intenet"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}