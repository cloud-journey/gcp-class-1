output "instance" {
    description = "Output the name of the instance"
    value       = google_compute_instance.learner_instance.name
}

output "private_ip" {
    description = "Output the private IP of the instance"
    value       = google_compute_instance.learner_instance.network_interface.0.network_ip
}

output "public_ip" {
    description = "Output the public IP of the instance"
    value       = google_compute_instance.learner_instance.network_interface.0.access_config.0.nat_ip
}