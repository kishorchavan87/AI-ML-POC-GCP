variable "project_id" {}
variable "region" {}
variable "env_name" {}
variable "network" {}
variable "subnetwork" {}

resource "google_composer_environment" "composer" {
  name   = var.env_name
  region = var.region

  config {
    node_count = 3

    software_config {
      image_version = "composer-2.0.36-airflow-2.5.1"
      pypi_packages = {
        "apache-airflow-providers-cncf-kubernetes" = "7.0.0"
        "kfp" = "2.0.1"
      }
      env_variables = {
        "PROJECT_ID" = var.project_id
      }
    }
  }
}

output "env_name" { value = google_composer_environment.composer.name }
