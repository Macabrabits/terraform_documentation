variable "environment" {
  default = "default"
}

resource "aws_iam_user" "my_iam_user" {
  name = "${local.iam_user_extension}_${var.environment}"
}


# local variables are not accessed from outside the module
locals {
  iam_user_extension = "my_iam_user_abc"
}






