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
}

provider "aws" {
  region = var.region
  # aws configure =====> access_key, secret_key ===> ~/.aws/credentials
}
