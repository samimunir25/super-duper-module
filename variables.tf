########################################
# Autoscaling group with Launch Template
########################################

variable "name" {
  type = string
}

variable "vpc_zone_identifier" {

}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "desired_capacity" {
  type = number
}

variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "tags" {

}

variable "user_data" {
  
}
/**
###########################
# Security Group
###########################

variable "description" {
  type = string
}

###########################
# Application Load Balancer
###########################

variable "vpc_id" {
  type = string
}

variable "subnets" {
  
}
**/