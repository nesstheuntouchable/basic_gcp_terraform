terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = "fast-cascade-416401"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = "fast-cascade-416401-f9a4ee6d81f6.json"
}

resource "google_storage_bucket" "fast-cascade-416401-tbucket-1" {
  name          = "copy_this_bucket_and_die"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}