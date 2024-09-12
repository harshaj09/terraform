# Variable definition:
variable "vpc_cidr_block" {}
variable "env_prefix" {}
variable "subnet_cidr_block" {}
variable "availability_zone" {}
variable "public_ip" {}
variable "ami_id" {} # "ami-0005e0cfe09cc9050"
variable "instance_type" {}
variable "public_key_data" {}
variable "region" {
  description = "This is the region where the infra should be created"
  default     = "us-east-1"
  type        = string
}