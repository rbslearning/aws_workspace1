module "rbs-ssh-public-key" {
  source     = "../aws_modules/key-pair"
  key_name   = var.key_name
  public_key = file("./id_rsa.pub")
}

module "jumphost-security-group" {
  source      = "../aws_modules/security-group"
  name        = "jumphost-security-group"
  email       = var.email
  description = "Allow ssh inbound traffic"
  vpc_id = data.terraform_remote_state.network.outputs.services-vpc-id
  ingress_rules = [
    {
      description = "SSH from Intenet"
      from_port   = 22
      to_port     = 22
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

module "jumphost" {
  source                      = "../aws_modules/ec2"
  name                        = var.jumphost_name
  email                       = var.email
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = module.rbs-ssh-public-key.key_name
  vpc_security_group_ids      = ["${module.jumphost-security-group.id}"]
  associate_public_ip_address = true
  subnet_id         = data.terraform_remote_state.network.outputs.jumphost-subnet1a-id
  volume_type       = var.volume_type
}

#proxy

module "proxy-security-group" {
  source      = "../aws_modules/security-group"
  name        = "proxy-security-group"
  email       = var.email
  description = "Allow 3128 inbound traffic"
  vpc_id = data.terraform_remote_state.network.outputs.services-vpc-id
  ingress_rules = [
    {
      description = "Allow all private IPs"
      from_port   = 3128
      to_port     = 3128
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/8"]
    },
    {
      description = "Allow all private IPs"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/8"]
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

module "proxy" {
  source                      = "../aws_modules/ec2"
  name                        = var.proxy_name
  email                       = var.email
  ami                         = var.proxy_ami
  instance_type               = var.instance_type
  key_name                    = module.rbs-ssh-public-key.key_name
  vpc_security_group_ids      = ["${module.proxy-security-group.id}"]
  associate_public_ip_address = true
  #subnet_id         = data.terraform_remote_state.network.outputs.proxy-subnet1a-id
  subnet_id         = data.terraform_remote_state.network.outputs.jumphost-subnet1a-id
  volume_type       = var.volume_type
  user_data         = "${data.template_file.user_data.rendered}"
}

data "template_file" "user_data" {
  template = "${file("proxy_squid.sh")}"
}