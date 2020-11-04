terraform {
  required_version = ">= 0.13.0"
  backend "s3" {
    bucket = "terraform-up-and-running-state-superb-gelding"
    key    = "s3/jenkins/terraform.tfstate"
    region = "us-east-2"
  }
}

