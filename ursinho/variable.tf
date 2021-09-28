variable "learner_id" {
  description  = "Learner ID from Cloud GCP class (remember it has to be lower case)"
  type         = string
  default      = "xxxx"
}

variable "region" {
  description  = "Region where the instance will be deployed"
  type         = string
  default      = "us-west2"
}

variable "avail_zone" {
  description  = "Availability zone where the instance will be deployed (please use lower case)"
  type         = string
  default      = "b"
}

variable "ssh_user" {
  description = "Name of the SSH user"
  type        = string
}

variable "ssh_pub_key_file" {
  description = "Location and name of the SSH public key file"
  type        = string
}

variable "project_name" {
  description = "Name of the project (it need to be lower case)"
  type        = string
  default     = "monitoria-groovetech"
}

variable "startup_script" {
  description = "Script to be run on startup"
  default     = "startup.sh"
}

variable "departament" {
  description = "Departament of the person requesting the resource"
  type        = string
}

variable "customer" {
  description = "Customer to which the resource will be allocated (groove-tech if there is no customer)"
  type        = string
}

variable "owner" {
  description = "Owner of the resource (who is responsable for the resource)"
  type        = string
}

variable "maintainer" {
  description = "Maintainer of the resource (who take care of the resource)"
  type        = string
}

variable "environment" {
  description = "Environment in which the resource is allocated (values can be dev, demo, QA, stage and prod)"
  type        = string
}

variable "data_classification" {
  description = "Which type of information the resource deals with (values can be public, internal, confidential and restricted)"
  type        = string
}

variable "application" {
  description = "Name of the application or service that the resource is part of"
  type        = string
}