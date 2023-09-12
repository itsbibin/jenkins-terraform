terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
      bucket         = "main-terraform-backend"
      key            = "network/terraform.tfstate"
      region         = "us-east-1"
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "cicd" {
  ami           = "ami-06b09bfacae1453cb"
  instance_type = "t3.micro"

  tags = {
    Name = "cicd"
  }
}
