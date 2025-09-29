terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.0.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-central1"
}

module "vpc" {
  source     = "./modules/vpc"
  project_id = var.project_id
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_name
}

module "gcs" {
  source     = "./modules/gcs_bucket"
  project_id = var.project_id
}

module "gke" {
  source     = "./modules/gke"
  project_id = var.project_id
}
