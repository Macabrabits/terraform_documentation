##setting up environment variables, so they don't go to the repository, doesn't work on bash
# On Windows
#set AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
#set AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
# On Linux
#export AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
#export AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>

provider "aws" {
    region = "us-east-1"
    version = "~> 2.63"  
}

#resource provider: aws
#resource type: s3_bucket
#resource name: my_s3_bucket (for referencing the resource)
resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "my-s3-bucket-topdevops-002" #s3 bucket names must be globaly unique
    versioning{
        enabled = true
    }  
}

resource "aws_iam_user" "my_iam_user" {
    name = "my_iam_user_abc"  
}






