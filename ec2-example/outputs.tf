output "instance-ip" {
  value = "${aws_eip.eip.public_ip}"
}