variable "input-submodule" {
  default = "default-value"
}

output "submodule-memory" {
  value = "${var.input-submodule}"
}