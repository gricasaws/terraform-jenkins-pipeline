terraform {
  required_version = "~> 0.12.0"
  backend "s3" {
    bucket = "jenkins-state-magical-polecat"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}