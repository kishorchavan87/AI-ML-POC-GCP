resource "google_compute_subnetwork" "subnet" {
  name          = "poc-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  network       = var.vpc_id
}
