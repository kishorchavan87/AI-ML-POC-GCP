resource "google_compute_network" "vpc_network" {
  name = "poc-vpc"
  auto_create_subnetworks = false
}
