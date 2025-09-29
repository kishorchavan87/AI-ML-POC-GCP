variable "project_id" {}

resource "google_cloudbuild_trigger" "docker_build" {
  name        = "mlops-docker-build"
  description = "Trigger for Docker builds"
  filename    = "cloudbuild.yaml"

  # Configure your GitHub repo settings after initial run
}
