variable "project_id" {}
variable "region" {}
variable "network_name" { default = "ml-vpc" }

resource "google_compute_network" "vpc" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.network_name}-subnet"
  ip_cidr_range = "10.10.0.0/16"
  network       = google_compute_network.vpc.id
  region        = var.region
}

output "network_name" { value = google_compute_network.vpc.name }
output "subnet_name" { value = google_compute_subnetwork.subnet.name }
