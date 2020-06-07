##setting up environment variables, so they don't go to the repository, doesn't work on bash
# On Windows
#set AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
#set AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
# On Linux
#export AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
#export AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>



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

# HTTP Server -> SG

  
variable "users" {
  default = {
    suzan : { country : "Netherlands", department : "ABC" },
    tom : { country : "US", department : "DEF" },
    camila : { country : "Brazil", department : "XYZ" }
  }
}

resource "aws_iam_user" "my_iam_users" {
  for_each = var.users
  name     = each.key
  tags = {
    #country: each.value
    country : each.value.country
    department : each.value.department
  }
}








