variable "project_id" {}
variable "region" {}
variable "instance_name" { default = "mlflow-db" }

resource "google_sql_database_instance" "mlflow" {
  name             = var.instance_name
  database_version = "POSTGRES_14"
  region           = var.region

  settings {
    tier = "db-custom-1-3840"
  }
}

resource "google_sql_database" "mlflow_db" {
  name     = "mlflow"
  instance = google_sql_database_instance.mlflow.name
}

resource "google_sql_user" "mlflow_user" {
  name     = "mlflowuser"
  instance = google_sql_database_instance.mlflow.name
  password = "ChangeMe123!"
}

output "instance_name" { value = google_sql_database_instance.mlflow.name }
