deployment "staging" {
  inputs = {
    vpc_id             = upstream_input.network_stack.vpc_id_staging
    subnet_private_id  = upstream_input.network_stack.subnet_private_id_staging
    subnet_public_id   = upstream_input.network_stack.subnet_public_id_staging
  }
}

deployment "prod" {
  inputs = {
    vpc_id             = upstream_input.network_stack.vpc_id_prod
    subnet_private_id  = upstream_input.network_stack.subnet_private_id_prod
    subnet_public_id   = upstream_input.network_stack.subnet_public_id_prod
  }
}

upstream_input "network_stack" {
  type = "stack"
  source = "tfcdev-6dad8c28.ngrok.app/hashicorp/Default_Project/demo-network-linked-stack-march11"
}
