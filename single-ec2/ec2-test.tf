provider "aws" {
  //london
  region = "eu-west-2"
//  shared_credentials_file = "~/.aws/credentials"
  profile = "prv"
}

resource "aws_instance" "bpk-tf-example" {
  ami = "ami-d97066bd"
  instance_type = "t2.micro"

  tags {
    Owner = "BPK"
  }
}