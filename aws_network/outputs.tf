output "web-vpc-id" {
  value = module.web-vpc.id
}

output "web-dmz-subnet1a-id" {
  value = module.web-dmz-subnet1a.id
}

output "web-dmz-subnet1b-id" {
  value = module.web-dmz-subnet1b.id
}

output "web-private-subnet1a-id" {
  value = module.web-private-subnet1a.id
}

output "web-private-subnet1b-id" {
  value = module.web-private-subnet1b.id
}

###################################

output "app-vpc-id" {
  value = module.app-vpc.id
}

output "app-subnet1a-id" {
  value = module.app-subnet1a.id
}

output "app-subnet1b-id" {
  value = module.app-subnet1b.id
}

###################################

output "db-vpc-id" {
  value = module.db-vpc.id
}

output "db-subnet1a-id" {
  value = module.db-subnet1a.id
}

output "web-db-subnet1b-id" {
  value = module.db-subnet1b.id
}

###################################

output "services-vpc-id" {
  value = module.services-vpc.id
}

output "jumphost-subnet1a-id" {
  value = module.jumphost-subnet1a.id
}

output "proxy-subnet1a-id" {
  value = module.proxy-subnet1a.id
}

# output "web-vpc-name" {
#   value = module.web-vpc.name
# }

###################################

output "aws-iam-instance-profile" {
  value = module.iam.name
}