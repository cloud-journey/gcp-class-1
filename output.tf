output "username" {
    description = "Output the name of the username"
    value       = data.google_compute_default_service_account.default.name
}

output "vpc" {
    description = "Output the name of the instance"
    value       = module.vpc.subnets_names
}


output "instance_Self_link" {
    description = "Output the name of the instance Self_link"
    value       = module.vm_instance_template.self_link
}


output "vm-ips_private" {
  description = "Output the instance VM Private IP"
  value = flatten(module.compute_instance.instances_details.*.network_interface.0.network_ip)
}

output "vm-ips_public" {
  description = "Output the instance VM Public IP"
  value = flatten(module.compute_instance.instances_details.*.network_interface.0.access_config.0.nat_ip)
}
