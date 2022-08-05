terraform {
  backend "s3" {
    bucket         = "mohamed-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    #dynamodb_table = "m.magdy"

  }
}

provider "aws" {
  region = var.region
}