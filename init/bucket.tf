resource "google_storage_bucket" "gcp_bucket"{
name     = var.bucket_name
project  = var.project_id
location = "EU"
}