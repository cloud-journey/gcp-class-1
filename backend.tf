terraform {
  backend "gcs" {
    bucket = "cloud-journey"
    prefix = "terraform-state/gcp-class-1"
  }
}
