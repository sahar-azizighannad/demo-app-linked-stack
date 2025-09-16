# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.3.2"
    }
  }
}

resource "random_pet" "api_private_hostname" {
  prefix = "https://api-app-${var.vpc_id}-${var.subnet_private_id}"
  length = 3
}

resource "random_pet" "api_public_hostname" {
  prefix = "https://api-app-${var.vpc_id}-${var.subnet_public_id}"
  length = 3
}