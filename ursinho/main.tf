provider "google" {
  region      = "${var.region}"
  zone        = "${var.region}-${var.avail_zone}"
  project     = "${var.project_name}"
}

// Tentativa de criar um projeto 

# resource "google_project" "learner_project" {
#   name                  = "project-${var.learner_id}"
#   project_id            = "project-${var.learner_id}"
#   auto_create_network   = false
#   labels                = {
#     application         = "${var.application}"
#     environment         = "${var.environment}"
#     customer            = "${var.customer}"
#     departament         = "${var.departament}"
#     owner               = "${var.owner}"
#     maintainer          = "${var.maintainer}"
#     data_classification = "${var.data_classification}"
#   }
# }

resource "google_compute_network" "learner_vpc" {
#  project                = google_project.learner_project.id
  name                    = "vpc-${var.learner_id}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "learner_sub_network" {
  name          = "subnet-us-west-2-bastion"
  ip_cidr_range = "10.20.30.0/28"
  network       = google_compute_network.learner_vpc.id
}

resource "google_compute_firewall" "learner_firewall" {
  name        = "us-west-2-ssh-only"
  network     = google_compute_network.learner_vpc.id

  allow {
    protocol  = "tcp"
    ports     = ["22"]
  }

  target_tags = ["ssh"]
}

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