locals {
  name   = "webserver_cluster"
  region = "us-east-1"
  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  user_data = <<-EOT
    #!/bin/bash
    hostname of this machine is '$(hostname)' > index.html
    nohup busybox httpd -f -p 8080 &
  EOT
}

module "webserver_cluster" {
  source = "../"
  name   = local.name

  ########################################
  # Autoscaling group with Launch Template
  ########################################

  vpc_zone_identifier = ["subnet-0b500aac1fdcbaf46", "subnet-059a091ed68ef41c6"]
  min_size            = 0
  max_size            = 1
  desired_capacity    = 1

  image_id      = "ami-00874d747dde814fa"
  instance_type = "t3.micro"

  user_data = base64encode(local.user_data)

  tags = local.tags

  ################
  # Security Group
  ################

  vpc_id = "vpc-05d88fb058a47caed"
  description = "Testing Security Group"
  

  ###########################
  # Application Load Balancer
  ###########################

#   subnets = ["subnet-059a091ed68ef41c6", "subnet-0b500aac1fdcbaf46"]
}

