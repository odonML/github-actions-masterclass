terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # OPCIONAL: Descomenta esto cuando tengas un bucket S3 para el estado
  # backend "s3" {
  #   bucket = "tu-nombre-de-bucket-terraform"
  #   key    = "astro-demo/terraform.tfstate"
  #   region = "us-east-1"
  # }
}

provider "aws" {
  region = var.aws_region
}