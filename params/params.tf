variable "supervar1" {}

output "externalOutput" {
  value = "input variable supervar1: ${var.supervar1}"
}