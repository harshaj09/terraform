# Create a VPC resource 
resource "aws_vpc" "tf-vpc" {
  // resource arguments
  cidr_block = var.vpc_cidr_block
  tags = {
    "Name" = "${var.env_prefix}-vpc"
  }
}



# Either i can write all the subnet code or, can call the module where subnet other rsources are already defined
# I will import a module
module "myapp-subnet" {
  source = "./subnet"
  vpc_id = aws_vpc.tf-vpc.id
  subnet_cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
  env_prefix = var.env_prefix
  public_ip = var.public_ip
  default_route_table_id = aws_vpc.tf-vpc.default_route_table_id
}


# Will import webserver module for vm's
module "myapp-webserver" {
  source = "./webserver"
  vpc_id = aws_vpc.tf-vpc.id
  env_prefix = var.env_prefix
  public_ip = var.public_ip
  public_key_data = var.public_key_data
  instance_type = var.instance_type
  ami_id = var.ami_id
  subnet_id = module.myapp-subnet.subnet.id
}



