module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 3.0"

  // Declarar esta variavel no variables.tf
  project_id = var.project_id

  // Trocar pelo nome de VPC que o desafio pede
  network_name = "example-vpc"

  subnets = [
    {
      // Renomear pro nome de subnet que consta no desafio
      subnet_name = "pvt-01"

      // Renomear pra range de IP que o desafio pede
      subnet_ip = "10.10.20.0/24"

      // Trocar pela região que o desafio pede
      subnet_region = "us-east1"
    }
  ]
}

data "google_compute_default_service_account" "default" {
}

module "vm_instance_template" {
  source     = "terraform-google-modules/vm/google//modules/instance_template"
  version    = "7.1.0"
  subnetwork = "pvt-01"
  service_account = {
    email  = data.google_compute_default_service_account.default.email
    scopes = ["cloud-platform"]
  }

  // Aqui vai a configuração de public key pra SSH
  metadata = {

  }

  // Aqui vai a tag "ssh"
  tags = []
}

// Usar este módulo para fazer a regra de firewall pedida no desafio:
// https://registry.terraform.io/modules/terraform-google-modules/network/google/latest/submodules/firewall-rules

module "compute_instance" {
  source        = "terraform-google-modules/vm/google//modules/compute_instance"
  version       = "7.1.0"
  num_instances = 1

  // Renomear pro nome de instância que consta no desafio
  hostname = "instance-simple"

  subnetwork        = "pvt-01"
  instance_template = module.vm_instance_template.self_link

  depends_on = [
    module.vpc
  ]
}
