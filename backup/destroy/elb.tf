resource "aws_elb" "web_elb" {
  name = "web-elb"
  security_groups = [
    "${module.webelb-security-group.id}"
  ]
  subnets = [
    "${data.terraform_remote_state.network.outputs.web-dmz-subnet1a-id}",
    "${data.terraform_remote_state.network.outputs.web-dmz-subnet1b-id}"
  ]

  cross_zone_load_balancing   = true

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:80/"
  }

  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "80"
    instance_protocol = "http"
  }

}

# resource "aws_lb" "ELB" {
#   name               = "rbs-web"
#   load_balancer_type = "application"

#   // Use all the subnets in your default VPC (Each subnet == different AZ)
#   subnets = [
#     "${data.terraform_remote_state.network.outputs.web-dmz-subnet1a-id}",
#     "${data.terraform_remote_state.network.outputs.web-dmz-subnet1b-id}"
#   ]
#   security_groups = ["${module.webelb-security-group.id}"]
# }

# // https://www.terraform.io/docs/providers/aws/r/lb_listener.html
# resource "aws_lb_listener" "http" {
#   load_balancer_arn = aws_lb.ELB.arn // Amazon Resource Name (ARN) of the load balancer
#   port = 80
#   protocol = "HTTP"

#   // By default, return a simple 404 page
#   default_action {
#     type = "fixed-response"
#     fixed_response {
#       content_type = "text/plain"
#       message_body = "404: page not found"
#       status_code  = 404
#     }
#   }
# }

# // create a target group for your ASG

# resource "aws_lb_target_group" "asg" {
#   name = "asg-example"
#   port = 80
#   protocol = "HTTP"
#   vpc_id = data.terraform_remote_state.network.outputs.web-vpc-id

#   health_check {
#     path = "/"
#     protocol = "HTTP"
#     matcher = "200"
#     interval = 15
#     timeout = 3
#     healthy_threshold = 2
#     unhealthy_threshold = 2
#   }
# }

# // https://www.terraform.io/docs/providers/aws/r/lb_listener_rule.html
# resource "aws_lb_listener_rule" "asg" {
#   listener_arn = aws_lb_listener.http.arn
#   priority = 100

#   action {
#     type = "forward"
#     target_group_arn = aws_lb_target_group.asg.arn
#   }
#   condition {
#     path_pattern {
#       values = ["*"]
#     }
#   }
# }