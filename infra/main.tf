provider "azurerm" {
  features {}
  subscription_id = "c36f74e0-d286-4b5f-8133-5e730bb31a23"
}

resource "azurerm_resource_group" "rg" {
  name     = "bootcamp-rg"
  location = "canadacentral"
}

resource "azurerm_app_service_plan" "appservice_plan" {
  name                = "bootcamp-asp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "App"
  reserved            = false

  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_application_insights" "insights" {
  name                = "bootcamp-insights"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}

resource "azurerm_app_service" "dev" {
  name                = "bootcamp-webapp-dev"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appservice_plan.id

  site_config {
    dotnet_framework_version = "v6.0"
  }

  app_settings = {
    "ASPNETCORE_ENVIRONMENT" = "Development"
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.insights.connection_string
    "ApplicationInsightsAgent_EXTENSION_VERSION" = "~3"
  }
}

resource "azurerm_app_service" "staging" {
  name                = "bootcamp-webapp-staging"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appservice_plan.id

  site_config {
    dotnet_framework_version = "v6.0"
  }

  app_settings = {
    "ASPNETCORE_ENVIRONMENT" = "Staging"
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.insights.connection_string
    "ApplicationInsightsAgent_EXTENSION_VERSION" = "~3"
  }
}

resource "azurerm_app_service" "prod" {
  name                = "bootcamp-webapp-prod"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appservice_plan.id

  site_config {
    dotnet_framework_version = "v6.0"
  }

  app_settings = {
    "ASPNETCORE_ENVIRONMENT" = "Production"
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.insights.connection_string
    "ApplicationInsightsAgent_EXTENSION_VERSION" = "~3"
  }
}
