#Modulo para criação de uma VPC
module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 3.0"

  project_id = "${var.project_id}"

  network_name = "vpc-${var.learner_id}"

  subnets = [
    {
      subnet_name = "${var.subnetwork_name}"

      subnet_ip = "10.20.30.0/28"

      subnet_region = "us-west2"
    }
  ]
}

#Modulo para criação de Regra do Firewall
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
    target_tags             = ["ssh"]
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
   
   depends_on = [
    module.vpc
  ]
  
}

# Usando service account do google para utilização no template da VM
data "google_compute_default_service_account" "default" {
  project = "${var.project_id}"
}

#Modulo para criação de Templante de VM, este template é obrigatorio pois é utlizado para criação da instancia pelo modulo compute_instance.
#Neste modulo definimos as configurações gerais da intancia, como imagem "source_image", tamanho do disco "disk_size_gb", tipo da instancia "machine_type" e etc.
module "vm_instance_template" {
  source     = "terraform-google-modules/vm/google//modules/instance_template"
  version    = "7.1.0"
  source_image = "debian-10"
  disk_size_gb = "30"
  machine_type = "e2-micro"
  source_image_project = "debian-cloud"
  name_prefix	= "bastion-vm-${var.learner_id}"
  subnetwork = module.vpc.subnets_names[0]
  subnetwork_project = "${var.project_id}"
  region = "us-west2" 
  project_id = "${var.project_id}"
  can_ip_forward = true
  startup_script = <<-SCRIPT
echo dejair > teste1.txt ;
sudo apt update ;
sudo apt install --yes apt-transport-https ca-certificates curl gnupg2 software-properties-common ;
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - ;
echo dejair > teste2.txt ;
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" ;
sudo apt update ;
echo dejair > teste3.txt ;
sudo apt install --yes docker-ce ;
echo dejair > concluido.txt ;
sudo deluser --remove-home tiago_alexandre ;
sudo deluser --remove-home weder ;
sudo deluser --remove-home groove ;
sudo deluser --remove-home tasal ;
sudo deluser --remove-home cloyoll ;
DOCKER_USER=$(tail -n 1 /etc/passwd | cut -d: -f 1) ;
sudo usermod -aG docker $DOCKER_USER ;
unset $DOCKER_USER ;
SCRIPT
  service_account = {
  email  = data.google_compute_default_service_account.default.email
  scopes = ["cloud-platform"]
  }

  metadata = {
    ssh-keys = "${var.user}:${var.ssh_pub_key}"
  }

  tags = ["ssh"]
}

#Modulo utilizado para criar a instancia no GCP, acess_config configurado para uso do IP público efêmero
module "compute_instance" {
  source        = "terraform-google-modules/vm/google//modules/compute_instance"
  version       = "7.1.0"
  num_instances = 1
  access_config = [(({nat_ip = ""
    network_tier = "STANDARD"}))]
  hostname = "bastion-vm-${var.learner_id}"
  zone = "us-west2-a"

  subnetwork = module.vpc.subnets_self_links[0]
  instance_template = module.vm_instance_template.self_link


  depends_on = [
    module.vpc
  ]
}


