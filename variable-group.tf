resource "azuredevops_variable_group" "azure_credentials" {
  project_id   = azuredevops_project.project.id
  name         = "Azure Credentials"
  description  = ""
  allow_access = true

  variable {
    name  = "ARM_CLIENT_ID"
    value = "BAR"
  }
  variable {
    name  = "ARM_CLIENT_SECRET"
    value = "BAR"
  }
  variable {
    name  = "ARM_TENANT_ID"
    value = "BAR"
  }
  variable {
    name  = "ARM_SUBSCRIPTION_ID"
    value = "BAR"
  }
}

resource "azuredevops_variable_group" "azure_backend" {
  project_id   = azuredevops_project.project.id
  name         = "Azure Backend"
  description  = ""
  allow_access = true

  variable {
    name  = "BACKEND_RESOURCE_GROUP_NAME"
    value = "BAR"
  }
  variable {
    name  = "BACKEND_STORAGE_ACCOUNT_NAME"
    value = "BAR"
  }
  variable {
    name  = "BACKEND_STORAGE_CONTAINER_NAME"
    value = "BAR"
  }
}