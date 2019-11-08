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

variable "key_path" {
  description = "EC2 instances SSH Public Key path"
}

variable "domain" {
  description = "Domain name to process the infra"
}

variable "aws_profile" {
  description = "AWS profile data"
}

variable "aws_credentials" {
  description = "AWS credentials file"
}

variable "ec2_list" {
  description = "ec2 names"
  type        = list(string)
  default     = ["admin", "client", "driver"]
}

variable "ports_list" {
  description = "Ports to redirect traffic to ec2"
  type        = list(number)
  default     = [3001, 3002, 3003]
}