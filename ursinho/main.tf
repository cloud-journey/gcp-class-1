# Indica qual a nuvem que será utilizada, assim como a região, zona e projeto.
provider "google" {
  region      = "${var.region}"
  zone        = "${var.region}-${var.avail_zone}"
  project     = "${var.project_name}"
}

# Cria a VPC
resource "google_compute_network" "learner_vpc" {
  name                    = "vpc-${var.learner_id}"
  auto_create_subnetworks = false
}

# Cria a subnet na VPC criada anteriormente
resource "google_compute_subnetwork" "learner_sub_network" {
  name          = "subnet-us-west-2-bastion"
  ip_cidr_range = "10.20.30.0/28"
  network       = google_compute_network.learner_vpc.id
}

# Cria a regra de firewall para a subnet criada anteriormente. A tag ssh indica que apenas as instâncias com a tag ssh receberão comunicação na porta 22.
resource "google_compute_firewall" "learner_firewall" {
  name        = "us-west-2-ssh-only"
  network     = google_compute_network.learner_vpc.id

  allow {
    protocol  = "tcp"
    ports     = ["22"]
  }

  target_tags = ["ssh"]
}

# Cria uma instância com um disco criado posteriormente, a tag ssh, um usuário e uma chave pública fornecida por variáveis e um script de inicialização.
resource "google_compute_instance" "learner_instance" {
  name                    = "bastion-vm-${var.learner_id}"
  machine_type            = "e2-micro"
  tags                    = ["ssh"]
  boot_disk {
    source                = google_compute_disk.learner_disk.id
  }
  can_ip_forward          = true
  network_interface {
    subnetwork            = google_compute_subnetwork.learner_sub_network.id
    access_config {}
  }
  metadata                = {
    ssh-keys              = "${var.ssh_user}:${var.ssh_pub_key}"
  }

  metadata_startup_script = "${file(var.startup_script)}"
  
 labels                   = {
     application          = "${var.application}"
     environment          = "${var.environment}"
     customer             = "${var.customer}"
     departament          = "${var.departament}"
     owner                = "${var.owner}"
     maintainer           = "${var.maintainer}"
     data_classification  = "${var.data_classification}"
 }
}

# Cria um disco SSD de 30GB com a imagem Debian 10 Buster para a instância acima.
resource "google_compute_disk" "learner_disk" {
  name                   = "bastion-disk-${var.learner_id}"
  size                   = "30"
  type                   = "pd-ssd"
  image                  = "debian-10-buster-v20210916"
  labels                 = {
     application         = "${var.application}"
     environment         = "${var.environment}"
     customer            = "${var.customer}"
     departament         = "${var.departament}"
     owner               = "${var.owner}"
     maintainer          = "${var.maintainer}"
     data_classification = "${var.data_classification}"
  }
}