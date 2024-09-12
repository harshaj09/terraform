# Settings block
terraform {
  #required_version = "~> 1.2.1"
  required_providers {
    # What provider i want to go with
    aws = {
      version = "~> 5.43.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    # the below one , should already be created 
    bucket = "i27academy-tf-devopsb3"
    region = "us-east-1"
    key = "dev/terraform.tfstate"
    # AWS provides locking mechanism with dynamodb table
    # the below one , should already be created 
    dynamodb_table = "terraform-dev-state-table"
  }
}

provider "aws" {
  region = var.region
  # aws configure =====> access_key, secret_key ===> ~/.aws/credentials
}
