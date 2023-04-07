module "webinstance-security-group" {
  source      = "../aws_modules/security-group"
  name        = "webinstance-security-group"
  email       = var.email
  description = "Allow ALB to access"
  vpc_id      = data.terraform_remote_state.network.outputs.web-vpc-id
  ingress_rules = [
    {
      description = "Allow all private IPs"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["${module.webelb-security-group.id}"]
    },
    {
      description = "Allow SSH Jumphost"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["10.4.0.0/16"]
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