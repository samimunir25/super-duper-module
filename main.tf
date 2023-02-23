##################################################################
# Autoscaling group with Launch Template
##################################################################

module "asg_with_launch_template" {
  source = "github.com/samimunir25/terraform-aws-autoscaling?ref=v6.7.1"

  name                = "${var.name}-asg"
  vpc_zone_identifier = var.vpc_zone_identifier
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity

  image_id      = var.image_id
  instance_type = var.instance_type

  user_data = var.user_data

  tags = var.tags
}

##################################################################
# Security Group
##################################################################

module "security_group" {
  source = "github.com/samimunir25/terraform-aws-security-group?ref=v4.17.1"

  name        = "${var.name}-sg"
  description = var.description
  vpc_id      = var.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["http-8080"]
  

}

##################################################################
# Application Load Balancer
##################################################################

# module "alb" {
#   source = "github.com/samimunir25/terraform-aws-alb?ref=v8.3.1"

#   name = "${var.name}-alb"
#   load_balancer_type = "application"
#   vpc_id  = var.vpc_id
#   subnets = var.subnets
#   security_groups    = ["sg-edcd9784", "sg-edcd9785"]

#   access_logs = {
#     bucket = "my-alb-logs"
#   }

#   target_groups = [
#     {
#       name_prefix      = "pref-"
#       backend_protocol = "HTTP"
#       backend_port     = 80
#       target_type      = "instance"
#       targets = {
#         my_target = {
#           target_id = "i-0123456789abcdefg"
#           port = 80
#         }
#         my_other_target = {
#           target_id = "i-a1b2c3d4e5f6g7h8i"
#           port = 8080
#         }
#       }
#     }
#   ]

#   https_listeners = [
#     {
#       port               = 443
#       protocol           = "HTTPS"
#       certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
#       target_group_index = 0
#     }
#   ]

#   http_tcp_listeners = [
#     {
#       port               = 80
#       protocol           = "HTTP"
#       target_group_index = 0
#     }
#   ]

#   tags = {
#     Environment = "Test"
#   }
# }