variable "vpc_cidr_block" {}

variable "ami_id" {
  type    = string
  default = "ami-04e5276ebb8451442"
}

variable "instance_type" {
  
}

variable "region" {
  description = "This is the region where the infra should be created"
  default     = "us-east-1"
  type        = string
}
# Create a VPC
resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    "Name" = "i27-${terraform.workspace}-vpc"
  }
}

# count====> count.index

# EC2 machine
resource "aws_instance" "tf-ec2" {
  count = terraform.workspace == "dev" ? 2 : 3
  #count         = 1 # 0,1,2
  ami           = var.ami_id
  #instance_type = var.instance_type[2] # 750 hours
  instance_type =  var.instance_type
  #key_name      = "terraformd3"
  #key_name = "newterraform"
  vpc_security_group_ids = [
    aws_security_group.tf-sg-allow-ssh.id,
    aws_security_group.tf-sg-allow-http-https.id
  ]
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo service httpd start
    sudo systemctl enable httpd
    echo "<h1> Welcome to depends_on Session </h1>" > /var/www/html/index.html
  EOF
  tags = {
    "Name" = "Webserver-${count.index}"
  }
  
}
