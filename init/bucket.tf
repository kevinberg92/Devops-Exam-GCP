resource "google_storage_bucket" "static-site"{
name     = var.bucket_name
project  = var.project_id
location = "EU"
}