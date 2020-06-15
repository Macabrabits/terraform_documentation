# ATTENTION !!! THIS ONLY WORKS WITH AUTHENTICATION BY ENVIRONMENT VARIABLES
#export AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
#export AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
# need to apply ../backend-state terraform project first !
terraform {
    backend "s3" {
        bucket = "dev-applications-name-backend-state-vhlm"      
        key = "dev/07-backend-state/users/backend-state" # This is the path on S3 bucket, if using workspaces, the path with the workspace name is placed at the start
        region = "us-east-1"
        dynamodb_table = "dev_application_locks"
        encrypt = true
    }
}

provider "aws" {
  region  = "us-east-1"
  version = "~> 2.63"  
}


# WORKSPACES
# Workspaces have diferent states across the same project
# COMMANDS:
# terraform workspace show
# terraform workspace new prod-env
# terraform workspace select default
# terraform workspace list
# terraform workspace delete prod-env

resource "aws_iam_user" "my_iam_user" {
  name = "${terraform.workspace}_my_iam_user_abc"
}






