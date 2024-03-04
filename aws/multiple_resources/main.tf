terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
  # access_key = "ACCESS_KEY"
  # secret_key = "SECRET_KEY"
}

resource "aws_instance" "app_server" {
  count         = 3  # Creates 3 instances
  ami           = "ami-0f5daaa3a7fb3378b"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Demo-${count.index}"
  }
}
