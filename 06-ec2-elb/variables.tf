variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "aws_key_pair" {
  type    = string
  default = "~/aws/aws_keys/default-ec2.pem"
}