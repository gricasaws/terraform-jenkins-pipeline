# terraform-jenkins-pipeline

# gitops-terraform-jenkins

# Overview

This repository will demonstrate an example GitOps workflow with Terraform and Jenkins.

The configuration in this repository was updated and now supports Terraform v0.12.28.

# NOTE

    Requirements
Terraform installed on Jenkins
Correct plugins installed on Jenkins
GitHub access token
AWS credentials
S3 bucket
Setup Bucket
You will need to create a bucket and reference the bucket name in the following section of main.tf:

terraform {
  backend "s3" {
    bucket = "XXXXXX"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
You can also update the key name to whatever you want your state file to be named.

# Plugins Required

Workspace Cleanup Plugin
Credentials Binding Plugin
AnsiColor Plugin
GitHub Plugin
Pipeline Plugin
CloudBees AWS Credentials Plugin
