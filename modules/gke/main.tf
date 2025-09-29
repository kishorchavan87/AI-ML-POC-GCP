variable "project_id" {}
variable "region" {}
variable "zone" {}
variable "cluster_name" {}
variable "network" {}
variable "subnetwork" {}

resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.zone
  network  = var.network
  subnetwork = var.subnetwork

  remove_default_node_pool = true
  initial_node_count       = 1

  networking_mode = "VPC_NATIVE"
  release_channel {
    channel = "REGULAR"
  }
}

resource "google_container_node_pool" "gke_nodes" {
  name       = "default-pool"
  location   = var.zone
  cluster    = google_container_cluster.gke.name

  node_config {
    machine_type = "e2-standard-4"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  initial_node_count = 3
}

output "cluster_name" { value = google_container_cluster.gke.name }
