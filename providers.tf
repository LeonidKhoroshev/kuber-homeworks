terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  local = {
      source  = "hashicorp/local"
      version = "~> 1.4"
    }
  }
  required_version = ">=1.4"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}

provider "local" {
  version = "~> 1.4"
}
