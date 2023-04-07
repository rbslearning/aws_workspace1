resource "aws_launch_configuration" "web" {
  name_prefix = "rbs-web-"

  image_id = "ami-0a72af05d27b49ccb" 
  instance_type = "t2.micro"
  key_name = "rbs-ssh-public-key"

  security_groups = [ "${module.webinstance-security-group.id}" ]
  user_data = "${file("data.sh")}"

  lifecycle {
    create_before_destroy = true
  }
}