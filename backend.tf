terraform {
  required_version = "~> 0.12.0"
  backend "s3" {
    bucket = "ziyo-project-state-magical-polecat"
    key    = "jenkins/terraform.tfstate"
    region = "us-west-2"
  }
}