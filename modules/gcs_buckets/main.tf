variable "project_id" {}
variable "region" {}
variable "bucket_names" {
  type = list(string)
}

resource "google_storage_bucket" "buckets" {
  for_each = toset(var.bucket_names)
  name     = "${var.project_id}-${each.value}"
  location = var.region
  force_destroy = true
}

output "buckets" {
  value = [for b in google_storage_bucket.buckets : b.url]
}
