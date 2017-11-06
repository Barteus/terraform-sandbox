variable "region" {
  default = "eu-west-1"
}

variable "instance-amis" {
  type = "map"
  description = "Instance ami"
  default = {
    "eu-west-1" = "ami-760aaa0f"
  }
}

variable "pgs-wro-cidr-lan" {
  default = "188.114.87.11/32"
}

variable "pgs-wro-cidr-wifi" {
  default = "188.114.87.10/32"
}

variable "key-name" {
  default = "bpk-sandbox"
}

variable "hello-text" {}