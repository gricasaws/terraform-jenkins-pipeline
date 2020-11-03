
# --------------------------------------------------------------------------------------------
# S3 BUCKET AND DYNAMODB LOCK TABLE
# --------------------------------------------------------------------------------------------

terraform {
    required_version = ">= 0.12"
}

# ---------------------------------------------------------------------------------------------
# CONFIGURE AWS CONNECTION
# ---------------------------------------------------------------------------------------------

provider "aws" {
    region = "us-east-2"
}

resource "random_pet" "this_pet" {
    length = 2
}

# -----------------------------------------------------------------------------------------------
# CREATE THE S3 BUCKET
# -----------------------------------------------------------------------------------------------

resource "aws_s3_bucket" "terraform_state" {
    bucket = "terraform-up-and-running-state-${random_pet.this_pet.id}"

    # Prevent accidental deletion of this S3 bucket

    lifecycle {
        prevent_destroy = true
    }

    # Enable versioning so we can see the full revision history of our
    # state files
    versioning {
        enabled = true
    }

    # Enable server-side encryption by default 
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
}

output "this_bucket_id" {
    value = aws_s3_bucket.terraform_state.id
    description = "The bucket_id output"
}

####################################################################################
## CREATING DynamoDB FOR LOCKING WITH TERRAFORM
##  NOTE! you must create a DynamoDB table that has a primary key called LockID
####################################################################################

resource "aws_dynamodb_table" "terraform_locks" {
    name = "terraform-up-and-running-locks" 
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}













