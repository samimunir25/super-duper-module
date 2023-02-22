locals {
  name   = "ex-asg-complete"
  region = "us-east-1"
  tags = {
    Owner       = "user"
    Environment = "dev"
  }

}

module "webserver_cluster" {
  source = "../"

  name = "default-${local.name}"

  vpc_zone_identifier = ["subnet-0408ef15c028fee36", "subnet-0821fd0ea753a5cd8"]
  min_size            = 0
  max_size            = 2
  desired_capacity    = 2

  image_id      = "ami-00874d747dde814fa"
  instance_type = "t3.micro"

  tags = local.tags

}

