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



provider "aws" {
  region     = "us-east-1"
  version    = "~> 2.63"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_default_vpc" "default" {
  # this is a special type of resource that is not created or destroyed
  # used to get the default vpc name, instead of hardcoding it
}



# HTTP Server -> SG

resource "aws_security_group" "http_server_sg" {
  name = "http_server_sg"
  # vpc_id = "vpc-cdb3aeb7"
  vpc_id = aws_default_vpc.default.id
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

  tags = {
    name : "http_server_sg"
  }
}



# Key pairs automatically referenced of ~/aws/aws_keys, there must be the private keys used on the following resource!
resource "aws_instance" "http_server" {
  # ami                    = "ami-09d95fab7fff3776c"
  ami                    = data.aws_ami.aws-linux-2-latest.id
  key_name               = "default-ec2"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  # subnet_id              = "subnet-01b3090f"
  subnet_id = tolist(data.aws_subnet_ids.default_subnets.ids)[0]

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_key_pair) #must be extension .pem, not .ppk
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo service httpd start",
      "echo Welcome to myServer - Virtual Server is at ${self.public_dns} | sudo tee /var/www/html/index.html"
    ]
  }




}


