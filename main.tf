module "vpc" {
  source       = "./modules/vpc"
  project_id   = var.project_id
  region       = var.region
  network_name = var.network_name
}

module "gcs_buckets" {
  source       = "./modules/gcs_buckets"
  project_id   = var.project_id
  region       = var.region
  bucket_names = ["etl-data", "ml-models", "ml-logs"]
}

module "artifact_registry" {
  source     = "./modules/artifact_registry"
  project_id = var.project_id
  region     = var.region
  repo_name  = "ml-docker-repo"
}

module "gke" {
  source       = "./modules/gke"
  project_id   = var.project_id
  region       = var.region
  zone         = var.zone
  cluster_name = "kubeflow-gke-cluster"
  network      = module.vpc.network_name
  subnetwork   = module.vpc.subnet_name
}

module "composer" {
  source     = "./modules/composer"
  project_id = var.project_id
  region     = var.region
  env_name   = "mlops-composer"
  network    = module.vpc.network_name
  subnetwork = module.vpc.subnet_name
}

module "cloudsql_mlflow" {
  source     = "./modules/cloudsql_mlflow"
  project_id = var.project_id
  region     = var.region
  instance_name = "mlflow-db"
}

module "service_accounts" {
  source     = "./modules/service_accounts"
  project_id = var.project_id
}
