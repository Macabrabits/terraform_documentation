##setting up environment variables, so they don't go to the repository, doesn't work on bash
# On Windows
#set AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
#set AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
# On Linux
#export AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
#export AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
#or 
#$terraform apply -var-file="aws.tfvars"
#$terraform plan -var-file="aws.tfvars"


#$terraform fmt   // format all terraform files
#$terraform validate // verify if there is some error on the terraform files
#$terraform show // shows what is in the tfstate (the known state of terraform)

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

provider "aws" {
  region     = "us-east-1"
  version    = "~> 2.63"
  access_key = var.access_key
  secret_key = var.secret_key
}

#Terraform can assume variable values from many sources.
#$export TF_VAR_iam_user_name_prefix=FROM_ENV_VARIABLE_IAM_PREFIX // Defines variable in the enviroment variables
#$terraform plan -refresh=false -var="iam_user_name_prefix=VALUE_FROM_COMMAND_LINE" // Defines variable in the command line
#Variables can also be assumed from './terraform.tfvars'
#if the variables are in a different tfvars file, use $terraform plan/apply -var-file="<filename>.tfvars"
variable "names" {
  default = ["Susan", "Dante", "Tom", "Jane"]
}



resource "aws_iam_user" "my_iam_user" {
  # This is problematic, since terraform get lost if you add a value anywhere but at the end of the list, since it uses the index of the list as a reference  
  # count = length(var.names)
  # name  = var.names[count.index]
  # This fixes the problem
  for_each = toset(var.names)  
  name = each.value
}






