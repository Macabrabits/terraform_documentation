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

resource "aws_security_group" "http_server_sg" {
  name   = "http_server_sg"
  vpc_id = "vpc-cdb3aeb7"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0             #anywhere
    to_port     = 0             #anywhere
    protocol    = -1            #all protocols
    cidr_blocks = ["0.0.0.0/0"] #anywhere
  }
}







