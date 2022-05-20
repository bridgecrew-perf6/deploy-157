variable "project" {
}

variable "credentials_file" {
}

variable "region" {
  default = "us-west1"
}

variable "zone" {
  default = "us-west1-a"
}


variable "project-name" {
  default = "videobug"
}

variable "os" {
  default = {
    centos7         = "centos-7-v20170816"
    debian9         = "debian-cloud/debian-9"
    ubuntu-1604-lts = "ubuntu-1604-xenial-v20170815a"
    ubuntu-1704     = "ubuntu-1704-zesty-v20170811"
  }
}

variable "vpc" {
  default = "videobug-vpc"
}