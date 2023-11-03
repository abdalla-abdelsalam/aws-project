variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for instances"
  type        = string
}

variable "instance_type" {
  description = "instance type for instances"
  type        = string
}

variable "sub_public" {
  description = "CIDR blocks for the public subnets"
  type        = list(any)
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(any)
}

variable "sub_private" {
  description = "CIDR blocks for the private subnets"
  type        = list(any)
}


variable "region" {
  description = "The AWS region"
  type        = string
}

variable "lambda_role_name" {
  description = "lambda role name"
  type        = string
}
