output "dev_app_url" {
  value = azurerm_app_service.dev.default_site_hostname
}

output "staging_app_url" {
  value = azurerm_app_service.staging.default_site_hostname
}

output "prod_app_url" {
  value = azurerm_app_service.prod.default_site_hostname
}
