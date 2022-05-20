terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

resource "google_compute_network" "videobug_vpc" {
  name = "videobug-network"
}


resource "google_compute_firewall" "default" {
  name    = "videobug-firewall"
  network = google_compute_network.videobug_vpc.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }
  allow {
    protocol = "all"
  }

  source_tags = ["web"]
}



data "template_file" "user_data" {
  template = file("../scripts/add-ssh-web-app.yaml")
}

resource "google_compute_instance" "test-instance" {
  name         = "test-instance"
  machine_type = "f1-micro"

  zone = "${var.zone}"

  tags = [
    "${var.vpc}-firewall-ssh",
    "${var.vpc}-firewall-http",
    "${var.vpc}-firewall-https",
    "${var.vpc}-firewall-icmp",
  ]
  metadata = {
    startup-script = data.template_file.user_data.rendered
  }

  boot_disk {
    initialize_params {
      image = "${var.os["debian9"]}"
    }
  }

  network_interface {
    network = google_compute_network.videobug_vpc.name

    access_config {
      // Ephemeral IP
    }
  }


  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}


