module "sub1" {
  source = "./sub"
}

module "sub2" {
  source = "./sub"
  input-submodule = "custom-value"
}

output "default-value" {
  value = "${module.sub1.submodule-memory}"
}

output "custom-value" {
  value = "${module.sub2.submodule-memory}"
}