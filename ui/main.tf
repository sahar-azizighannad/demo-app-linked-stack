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

resource "random_pet" "ui_private_hostname" {
  prefix = "https://ui-app-${var.vpc_id}-${var.subnet_private_id}"
  length = 3
}

resource "random_pet" "ui_public_hostname" {
  prefix = "https://ui-app-${var.vpc_id}-${var.subnet_public_id}"
  length = 3
}