resource "google_container_cluster" "primary" {
  name     = "poc-gke-cluster"
  location = "us-central1"
  initial_node_count = 1
}
