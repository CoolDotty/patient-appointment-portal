output "frontend_url" {
  description = "The primary endpoint of the static website."
  value       = azurerm_storage_account.frontend.primary_web_endpoint
}

output "backend_hostname" {
  description = "The hostname of the backend App Service."
  value       = azurerm_linux_web_app.backend.default_hostname
}

output "backend_app_service_name" {
  description = "The name of the backend App Service."
  value       = azurerm_linux_web_app.backend.name
}

output "storage_account_name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.frontend.name
}

output "resource_group_name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.main.name
}
