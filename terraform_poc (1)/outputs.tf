output "vpc_name" { value = module.vpc.vpc_name }
output "subnet_name" { value = module.subnet.subnet_name }
output "bucket_name" { value = module.gcs.bucket_name }
output "gke_cluster_name" { value = module.gke.gke_cluster_name }
