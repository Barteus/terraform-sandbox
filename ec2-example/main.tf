provider "aws" {
  //ireland
  region = "${var.region}"
}

resource "aws_instance" "bpk-tf-example" {
  ami = "${var.instance-amis["${var.region}"]}"
  instance_type = "t2.micro"
  key_name = "${var.key-name}"

  vpc_security_group_ids = [
    "${aws_security_group.security-group.id}"]

  tags {
    Owner = "BPK"
    Name = "BPK-instance"
    hello-text = "${var.hello-text}"
  }

  user_data = <<EOF
#!/bin/bash
yum update -y
yum install httpd -y
service httpd start
EOF
}

resource "aws_eip" "eip" {
  instance = "${aws_instance.bpk-tf-example.id}"
  vpc = true
}

resource "aws_security_group" "security-group" {

  name = "BPK-instance-sg"
  description = "BPK-instance allowed prots"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = [
      "${var.pgs-wro-cidr-lan}",
      "${var.pgs-wro-cidr-wifi}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}