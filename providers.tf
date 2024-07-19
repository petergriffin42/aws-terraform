terraform {
  required_version = ">=1.0"

  required_providers {

    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    
  aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}