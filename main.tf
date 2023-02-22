
module "autoscaling" {
  source = "github.com/samimunir25/terraform-aws-autoscaling?ref=v6.7.1"

  name                = var.name
  vpc_zone_identifier = var.vpc_zone_identifier
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity

  image_id      = var.image_id
  instance_type = var.instance_type

  tags = var.tags
}

# module "alb" {
#     source = "github.com/samimunir25/terraform-aws-alb?ref=v8.3.1"
# }

# module "security_group" {
#     source = "github.com/samimunir25/terraform-aws-security-group?ref=v4.17.1"
# }