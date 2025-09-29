resource "google_storage_bucket" "bucket" {
  name     = "${var.project_id}-poc-bucket"
  location = "US"
}
