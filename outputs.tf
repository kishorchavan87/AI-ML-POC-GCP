output "gcs_buckets" {
  value = module.gcs_buckets.buckets
}

output "artifact_registry" {
  value = module.artifact_registry.repo_id
}

output "gke_cluster_name" {
  value = module.gke.cluster_name
}

output "composer_env" {
  value = module.composer.env_name
}

output "cloudsql_instance" {
  value = module.cloudsql_mlflow.instance_name
}
