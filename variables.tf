variable "company" {
  description = "Company short name, used as the first part of every resource name"
  type        = string
  default     = "jag"
}

variable "product" {
  description = "Product or platform the resources belong to"
  type        = string
  default     = "platform"
}

variable "environment" {
  description = "Environment / account type: dev, pre, prod or shared"
  type        = string
  default     = "shared"
  validation {
    condition     = contains(["dev", "pre", "prod", "shared"], lower(var.environment))
    error_message = "environment must be one of: dev, pre, prod, shared."
  }
}

variable "owner" {
  description = "Owner of the resources (used in tags)"
  type        = string
  default     = "Juan"
}

variable "region" {
  description = "AWS region where the state bucket is created"
  type        = string
  default     = "us-east-1"
}
