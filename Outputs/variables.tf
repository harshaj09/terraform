variable "region" {
  description = "This is the region where the infra should be created"
  default     = "us-east-1"
  type        = string
}

variable "instance_count" {
  description = "How many instances are needed"
  type = number
  default = 1
}

variable "ami_id" {
  type    = string
  default = "ami-04e5276ebb8451442"
}

variable "instance_name" {
  description = "instnace name"
  default = "defaultname"
  type = string
}

variable "instance_tags" {
  description = "Instance tags used for"
  type = map(string)
  default = {
    "Name" = "webserver"
    "Owner" = "SRE"
  }
}

variable "instance_type" {
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "test" = "t2.small"
    "prod" = "t3.medium"
  }
}