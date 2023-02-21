locals {
  name   = "ex-asg-complete"
  region = "eu-west-1"
  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  user_data = <<-EOT
  #!/bin/bash
  echo "Hello Terraform!"
  EOT
}