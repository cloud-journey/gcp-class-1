variable "learner_id" {
  type        = string
  description = "The learner four-characters identifier"
}

variable "project_id" {
  type        = string
  description = "Project identifier"
}

variable "ssh_pub_key" {
  type        = string
  description = "SSH Key for VM connection"
}

variable "subnetwork_name" {
  type        = string
  description = "The learner four-characters identifier"
}


variable "user" {
  type        = string
  description = "Usuario para acesso a maquina"
}

variable "script" {
  type = string
  description = "Script Docker"
}