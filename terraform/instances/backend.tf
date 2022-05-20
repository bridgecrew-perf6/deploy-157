terraform {
  backend "gcs" {
    bucket  = "videobug-state"
    prefix    = "videobug/terraform/state/terraform.tfstate"
    credentials = "../credentials.json"
  }
}