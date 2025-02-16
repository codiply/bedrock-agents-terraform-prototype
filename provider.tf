terraform {
  backend "s3" {
    bucket = "terraform-state-340808513522-eu-west-1"
    key    = "bedrock-agents-terraform-prototype/terraform.tfstate"
    region = "eu-west-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.86.1"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}