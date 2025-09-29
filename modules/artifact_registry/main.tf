variable "project_id" {}
variable "region" {}
variable "repo_name" { default = "ml-docker-repo" }

resource "google_artifact_registry_repository" "repo" {
  provider      = google
  location      = var.region
  repository_id = var.repo_name
  format        = "DOCKER"
  description   = "Docker repo for MLOps images"
}

output "repo_id" { value = google_artifact_registry_repository.repo.repository_id }
