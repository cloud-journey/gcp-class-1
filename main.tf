# My learner storage
resource "google_storage_bucket_object" "learner_id_file" {
  name   = "gcp-class/1/${var.learner_id}"
  source = "./learner-id"
  bucket = "cloud-journey"
}
