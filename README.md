# gitops-terraform-jenkins

# Overview

This repository will demonstrate an example GitOps workflow with Terraform and Jenkins.

The configuration in this repository was updated and now supports Terraform v0.12.28.

# NOTE

    Requirements

1. Terraform installed on Jenkins;
2. Correct plugins installed on Jenkins
3. GitHub access token
4. AWS credentials
5. S3 bucket
6. Setup Bucket
    You will need to create a bucket and reference the bucket name in the following section of main.tf:

``` bash
    terraform {
        backend "s3" {
            bucket = "XXXXXX"
            key    = "terraform.tfstate"
            region = "us-east-1"
  }
}
```

You can also update the key name to whatever you want your state file to be named.

# Plugins Required

1. Workspace Cleanup Plugin;
2. Credentials Binding Plugin;
3. AnsiColor Plugin;
4. GitHub Plugin;
5. Pipeline Plugin;
6. CloudBees AWS Credentials Plugin;
