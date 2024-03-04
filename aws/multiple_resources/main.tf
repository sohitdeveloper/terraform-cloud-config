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
  access_key = "AKIAQ6FDGR5YY3TVUYLW" 
  secret_key = "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"
}

resource "aws_instance" "app_server" {
  count         = 3  # Creates 3 instances
  ami           = "ami-0f5daaa3a7fb3378b"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Demo-${count.index}"
  }
}
