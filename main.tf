terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.56.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.45.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "azurerm" {
  features {
  }
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_s3_bucket" "aws_sw_bucket_1" {
  bucket = "terraform-maintf"
}

resource "aws_instance" "ec2_machine_1" {
  ami           = "ami-0dcc1e21636832c5d"
  instance_type = "t2.micro"
  tags = {
    "Name" = "machine1"
  }
}

resource "azurerm_resource_group" "az_rg_1" {
  name     = "az_rg_maintf"
  location = "East US"
}
