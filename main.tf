terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.5"

  backend "s3" {
    bucket         = "terraform-state-bucket-175"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
  }
}

provider "aws" {
  region = var.aws_region
}

provider "azurerm" {
  features {}
}

module "aws" {
  source     = "./modules/aws"
  aws_region = var.aws_region
}

module "azure" {
  source = "./modules/azure"
}

output "aws_ec2_ip" {
  value = module.aws.ec2_public_ip
}

output "azure_storage_account" {
  value = module.azure.storage_account_name
}
