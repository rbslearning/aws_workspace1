output "jumphost-public-ip" {
  value = module.jumphost.public_ip
}

output "jumphost-sg-id" {
  value = module.jumphost-security-group.id
}

output "jumphost-dns" {
  value = module.jumphost.proxy_dns
}

####################

output "proxy-public-ip" {
  value = module.jumphost.public_ip
}

output "proxy-sg-id" {
  value = module.jumphost-security-group.id
}

output "proxy-dns" {
  value = module.proxy.proxy_dns
}