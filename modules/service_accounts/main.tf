variable "project_id" {}

resource "google_service_account" "composer_sa" {
  account_id   = "composer-sa"
  display_name = "Composer service account"
}

resource "google_service_account" "gke_node_sa" {
  account_id   = "gke-node-sa"
  display_name = "GKE node service account"
}

output "composer_sa_email" { value = google_service_account.composer_sa.email }
output "gke_node_sa_email" { value = google_service_account.gke_node_sa.email }
