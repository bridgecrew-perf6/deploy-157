data "google_compute_subnetwork" "videobug_vpc_subnet" {
  name   = "${var.vpc}-subnet"
  region = "${var.region}"
}

data "google_compute_network" "videobug_vpc" {
  name = "${var.vpc}"
}