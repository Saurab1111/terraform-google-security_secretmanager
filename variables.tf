variable "project_id" {
  type        = string
  description = "GCP project ID where the secret will be created"
}

variable "secret_id" {
  type        = string
  description = "Unique Secret Manager secret identifier"
  default     = "application-secret"
}

variable "labels" {
  type        = map(string)
  description = "Labels to apply to the secret"
  default = {
    environment = "dev"
  }
}

variable "replication" {
  type        = string
  description = "Replication policy type: automatic or user_managed"
  default     = "automatic"

  validation {
    condition     = contains(["automatic", "user_managed"], var.replication)
    error_message = "Replication must be either automatic or user_managed."
  }
}

variable "locations" {
  type        = list(string)
  description = "Replica locations for user managed replication"
  default     = ["asia-south1", "asia-south2"]
}

variable "secret_data" {
  type        = string
  description = "Initial secret payload"
  sensitive   = true
  default     = "change-me"
}
