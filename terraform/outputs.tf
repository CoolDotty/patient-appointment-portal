output "static_web_app_name" {
  description = "The name of the static web app."
  value       = azurerm_static_web_app.frontend.name
}

output "static_web_app_url" {
  description = "The URL of the static web app."
  value       = azurerm_static_web_app.frontend.default_host_name
}

output "static_web_app_api_key" {
  description = "The API key for the static web app, used for deployment."
  value       = azurerm_static_web_app.frontend.api_key
  sensitive   = true
}

output "backend_hostname" {
  description = "The hostname of the backend App Service."
  value       = azurerm_linux_web_app.backend.default_hostname
}

output "backend_app_service_name" {
  description = "The name of the backend App Service."
  value       = azurerm_linux_web_app.backend.name
}

output "resource_group_name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.main.name
}
