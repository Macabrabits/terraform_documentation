module "user_module"{
    source = "../../terraform-modules/users"
    environment = "qa"
}

variable "access_key"{

}

variable "secret_key"{

}

provider "aws" {
  region     = "us-east-1"
  version    = "~> 2.63"
  access_key = var.access_key
  secret_key = var.secret_key  
}