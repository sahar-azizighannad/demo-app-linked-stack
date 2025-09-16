# Child/Downstream Stack - Application Configuration
# This stack represents an application managed by a product team.
# It makes use of the VPC outputs published from the network stack.
# It doesn't actually provision infrastructure.

variable "vpc_id" {
  description = "vpc_id"
  type        = string
}

variable "subnet_private_id" {
  description = "subnet_private_id"
  type        = string
}

variable "subnet_public_id" {
  description = "subnet_public_id"
  type        = string
}

required_providers {
  random = {
    source  = "hashicorp/random"
    version = "~> 3.5.1"
  }

  null = {
    source  = "hashicorp/null"
    version = "~> 3.2.2"
  }
}

provider "random" "this" {}

component "api" {

  source = "./api"

  inputs = {
    vpc_id             = var.vpc_id
    subnet_private_id  = var.subnet_private_id
    subnet_public_id   = var.subnet_public_id
  }

  providers = {
    random = provider.random.this
  }
}

component "ui" {
  source = "./ui"

  inputs = {
    vpc_id             = var.vpc_id
    subnet_private_id  = var.subnet_private_id
    subnet_public_id   = var.subnet_public_id
  }

  providers = {
    random = provider.random.this
  }
}

output "ui_private_hostname" {
  value = component.ui.ui_private_hostname
  type = string
}

output "ui_public_hostname" {
  value = component.ui.ui_public_hostname
  type = string
}

output "api_private_hostname" {
  value = component.api.api_private_hostname
  type = string
}

output "api_public_hostname" {
  value = component.api.api_public_hostname
  type = string
}
