resource "google_service_account" "default"{
account_id   = "compute-service"
display_name = "Compute Service"
}

resource "google_compute_instance" "default"{
name         = "exam-compute"
machine_type = var.machine_type
zone         = "us-central1-a"

tags = ["pgr301", "exam"]

boot_disk{
initialize_params{
image = "debian-cloud/debian-9"
}
}

network_interface{
network = "default"

access_config{
//Ephemeral IP
}
}

service_account{
email  = google_service_account.default.email
scopes = ["cloud-platform"]
}

allow_stopping_for_update = true
can_ip_forward = true

}
