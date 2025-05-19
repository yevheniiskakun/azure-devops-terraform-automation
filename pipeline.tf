resource "azuredevops_build_definition" "example" {
  project_id = azuredevops_project.project.id
  name       = "Terraform Plan"
  path       = "\\ExampleFolder"

  ci_trigger {
    use_yaml = false
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.infra-repo.id
    branch_name = azuredevops_git_repository.infra-repo.default_branch
    yml_path    = ".azdo-pipelines/terraform-multi-stage.yaml"
  }

  variable_groups = [
    azuredevops_variable_group.azure_credentials.id,
    azuredevops_variable_group.azure_backend.id
  ]

  variable {
    name  = "ApplicationName"
    value = "app-name"
  }

}