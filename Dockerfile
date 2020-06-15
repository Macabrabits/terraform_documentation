FROM ubuntu:18.04

RUN apt update &&\
    apt upgrade -y &&\
    apt install curl -y &&\
    apt install unzip -y &&\
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&\
    unzip awscliv2.zip &&\
    ./aws/install &&\
    curl https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip -o terraform.zip &&\
    unzip terraform.zip &&\
    mv terraform /usr/local/bin/terraform

# just a command to keep the container up
CMD tail -f /dev/null