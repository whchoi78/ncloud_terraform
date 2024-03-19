terraform {
  required_version = ">= 0.13"
  required_providers {
    ncloud = {
      source = "navercloudplatform/ncloud"
    }
  }
}
provider "ncloud" {
  access_key = var.ncloud_access_key
  secret_key = var.ncloud_secret_key
  region     = var.region
  site = var.site
  support_vpc = var.support_vpc
}