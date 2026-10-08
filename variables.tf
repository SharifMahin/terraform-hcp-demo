variable "resource_group_name" {
  type        = string
  description = "Resource group name"

  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "Resource group name cannot be empty."
  }
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "japaneast"
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name — globally unique, lowercase, max 24 chars"

  validation {
    condition     = length(var.storage_account_name) <= 24 && can(regex("^[a-z0-9]+$", var.storage_account_name))
    error_message = "Storage account name must be lowercase alphanumeric only and max 24 characters."
  }
}

variable "container_name" {
  type        = string
  description = "Blob container name"

  validation {
    condition     = length(var.container_name) >= 3 && length(var.container_name) <= 63 && can(regex("^[a-z0-9-]+$", var.container_name))
    error_message = "Container name must be 3-63 characters, lowercase alphanumeric and hyphens only."
  }
}

variable "tags" {
  type        = map(string)
  default     = {}
}
