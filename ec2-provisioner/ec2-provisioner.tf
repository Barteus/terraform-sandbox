provider "aws" {
  //london
  region = "eu-west-2"
  profile = "prv"
}

data "aws_ami" "amazon-ami" {
  most_recent = true

  filter {
    name = "name"
    values = [
      "amzn-ami-hvm-*"]
  }

  filter {
    name = "root-device-type"
    values = [
      "ebs"
    ]
  }

  filter {
    name = "virtualization-type"
    values = [
      "hvm"]
  }

  owners = [
    "137112412989"]
}

resource "aws_instance" "bpk-tf-example" {
  ami = "${data.aws_ami.amazon-ami.id}"
  instance_type = "t2.micro"

  tags {
    Owner = "BPK"
  }

  provisioner "local-exec" {
    command = "echo 'public_ip : ${aws_instance.bpk-tf-example.public_ip}'"
  }

}