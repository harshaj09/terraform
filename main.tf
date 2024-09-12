provider "aws" {
  region = "us-east-1"
}


# google provider 
provider "google" {
  region = "us-central1"
}


resource "aws_instance" "tf-vpc" {
  ami            = "afsadfasdfasdfa"
  instance_types = "siva"
}

#