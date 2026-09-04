output "secret_id" {
  description = "Secret resource ID"
  value       = google_secret_manager_secret.this.id
}

output "secret_name" {
  description = "Secret name"
  value       = google_secret_manager_secret.this.name
}

output "secret_version" {
  description = "Created secret version"
  value       = google_secret_manager_secret_version.this.name
}
