variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

provider "aws" {
  region  = "us-east-1"
  version = "~> 2.63"
  # access_key = var.access_key
  # secret_key = var.secret_key
  #  shared_credentials_file = "/Users/Dev/.aws/credentials"
  # profile = "terraform"
}


resource "aws_s3_bucket" "enterprise_backend_state" {
  bucket = "dev-applications-name-backend-state-vhlm"

  # lifecycle {
  #   prevent_destroy = true
  # }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "enterprise_backend_lock" {
  name         = "dev_application_locks"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

}