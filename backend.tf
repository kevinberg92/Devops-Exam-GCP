terraform{
backend "gcs"{
bucket      = "pgr301-ex02-bucket"
prefix      = "terraformstate"
credentials = "google-key.json"
}
}