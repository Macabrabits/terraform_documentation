data "aws_subnet_ids" "default_subnets" {
  # terraform console > data.aws_subnet_ids.default_subnets
  # terraform console > tolist(data.aws_subnet_ids.default_subnets.ids)[0] //gets first subnet id
  vpc_id = aws_default_vpc.default.id
}

data "aws_ami" "aws-linux-2-latest" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

}