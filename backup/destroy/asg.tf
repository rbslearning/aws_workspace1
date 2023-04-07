resource "aws_autoscaling_group" "web" {
  name = "${aws_launch_configuration.web.name}-asg"

  min_size             = 1
  desired_capacity     = 1
  max_size             = 2
  

  launch_configuration = aws_launch_configuration.web.name
  health_check_grace_period = 300 // Time after instance comes into service before checking health.

  health_check_type = "ELB" 
  target_group_arns = [aws_lb_target_group.asg.arn]

  #launch_configuration = "${aws_launch_configuration.web.name}"

  # enabled_metrics = [
  #   "GroupMinSize",
  #   "GroupMaxSize",
  #   "GroupDesiredCapacity",
  #   "GroupInServiceInstances",
  #   "GroupTotalInstances"
  # ]

  # metrics_granularity = "1Minute"

  vpc_zone_identifier  = [
    "${data.terraform_remote_state.network.outputs.web-private-subnet1a-id}",
    "${data.terraform_remote_state.network.outputs.web-private-subnet1b-id}"
  ]

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${var.name}"
    propagate_at_launch = true
  }  
  tag {
    key                 = "email"
    value               = "${var.email}"
    propagate_at_launch = true
  }

}
