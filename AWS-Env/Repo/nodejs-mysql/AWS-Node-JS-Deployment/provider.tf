terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
  shared_credentials_files = ["C:/Users/ASUS/.aws/credentials"]
  profile                  = "terraform_ux"
}