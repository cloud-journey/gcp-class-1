module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 3.0"

  project_id = "${var.project_id}"

  network_name = "vpc-${var.learner_id}"

  subnets = [
    {
      subnet_name = "subnet-us-west-2-bastion"

      subnet_ip = "10.20.30.0/28"

      subnet_region = "us-west2"
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

  metadata = {
    ssh_pub_key = "${var.ssh_pub_key}"
  }

  tags = ["ssh"]
}


module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  project_id   = "${var.project_id}"
  network_name = "vpc-${var.learner_id}"

  rules = [{
    name                    = "allow-ssh-ingress"
    description             = "Regra firewall para habilitar trafego de internet"
    direction               = "INGRESS"
    priority                = null
    ranges                  = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = "ssh"
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]
}

module "compute_instance" {
  source        = "terraform-google-modules/vm/google//modules/compute_instance"
  version       = "7.1.0"
  num_instances = 1

  hostname = "bastion-vm-${var.learner_id}"

  subnetwork        = "pvt-01"
  instance_template = module.vm_instance_template.self_link

  depends_on = [
    module.vpc
  ]
}
