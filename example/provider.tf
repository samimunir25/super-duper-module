provider "aws" {
  region = local.region

  default_tags {
    tags = {
      Project = "terraform-aws-autoscaling"
    }
  }
}
