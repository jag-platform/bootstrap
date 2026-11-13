provider "aws" {
  region  = var.region
  profile = "jag-shared"

  default_tags {
    tags = local.common_tags
  }
}
