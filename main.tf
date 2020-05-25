provider "aws" {
    region = "us-east-1"
    version = "~> 2.63"  
}

resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "my-s3-bucket-topdevops-001" #s3 bucket names must be globaly unique
  
}

##setting up environment variables, so they don't go to the repository, doesn't work on bash
# On Windows
#set AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
#set AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
# On Linux
#export AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
#export AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
