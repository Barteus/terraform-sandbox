module "ec2-module" {
  source = "../ec2-example"
  "hello-text" = "text1"
}

output "ip" {
  value = "${module.ec2-module.instance-ip}"
}