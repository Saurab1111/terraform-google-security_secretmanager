resource "google_secret_manager_secret" "this" {
  project   = var.project_id
  secret_id = var.secret_id

  labels = var.labels

  dynamic "replication" {
    for_each = var.replication == "automatic" ? [1] : []
    content {
      automatic = true
    }
  }

  dynamic "replication" {
    for_each = var.replication == "user_managed" ? [1] : []
    content {
      user_managed {
        dynamic "replicas" {
          for_each = var.locations
          content {
            location = replicas.value
          }
        }
      }
    }
  }
}

resource "google_secret_manager_secret_version" "this" {
  secret      = google_secret_manager_secret.this.id
  secret_data = var.secret_data
}
