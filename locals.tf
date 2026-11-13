locals {
  environment = lower(var.environment)
  account_id  = data.aws_caller_identity.current.account_id
  prefix      = "${var.company}-${var.product}-${local.environment}-${local.account_id}" # common prefix for all resource names

  common_tags = {
    company     = upper(var.company)
    product     = var.product
    owner       = var.owner
    environment = local.environment
    managed_by  = "Terraform"
  }
}
