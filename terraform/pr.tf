# Adding Plugin
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
# Adding provider
provider "aws" {
  region     = "ap-southeast-1"
}
