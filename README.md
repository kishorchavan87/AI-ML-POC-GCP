# GCP MLOps Terraform + Sample Code Repo (POC)

This archive provisions modular GCP infra for an Airflow (Cloud Composer) + Kubeflow (GKE) + MLflow + Voxel51 POC.
It also includes sample Dockerfiles, Cloud Build config, an Airflow DAG and a Kubeflow pipeline scaffold so you can run an end-to-end POC.

## Quick start
1. Update `terraform.tfvars` with your `project_id` and optionally region/zone.
2. Initialize & apply:

```bash
terraform init
terraform apply -var-file=terraform.tfvars
```

3. After GKE is created, authenticate kubectl:
```bash
gcloud container clusters get-credentials kubeflow-gke-cluster --zone your-zone --project your-project-id
```

4. Deploy sample K8s manifests (MLflow, Voxel51, minimal Kubeflow Pipeline API) located in `modules/gke/`:
```bash
kubectl apply -f modules/gke/namespace.yaml
kubectl apply -f modules/gke/kubeflow_install.yaml
kubectl apply -f modules/gke/mlflow_deploy.yaml
kubectl apply -f modules/gke/voxel51_deploy.yaml
```

5. Use Cloud Build triggers or `gcloud builds submit` to build/push the sample images (Cloud Build config included).

## Contents
- Terraform modules for vpc, gke, composer, artifact registry, gcs buckets, cloudsql, service accounts
- Sample Dockerfiles: `etl/`, `train/`, `fiftyone/`
- Airflow DAG: `dags/etl_trigger_kf.py`
- Kubeflow pipeline scaffold: `kfp_pipelines/train_pipeline.py`
- Cloud Build config: `cloudbuild.yaml`

Customize the repo for production readiness: IAM, private cluster, Workload Identity, network security, and backups.
