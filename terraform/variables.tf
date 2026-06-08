variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "app_name" {
  description = "Application name used for resource naming"
  type        = string
  default     = "devops-infinity"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "production"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "app_version" {
  description = "Application version to deploy"
  type        = string
  default     = "1.0.0"
}
