variable "aws_region" {
  description = "Region for the VPC"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "Environment, could be: dev, prod"
}

variable "public_subnet_cidr_a" {
  description = "CIDR for the public subnet"
  default     = "10.0.0.0/24"
}

variable "public_subnet_cidr_b" {
  description = "CIDR for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_a" {
  description = "CIDR for the private subnet"
  default     = "10.0.2.0/24"
}

variable "private_subnet_cidr_b" {
  description = "CIDR for the private subnet"
  default     = "10.0.3.0/24"
}