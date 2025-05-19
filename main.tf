resource "azuredevops_project" "project" {
  name        = "Automation project"
  description = "Project Description"
}

resource "azuredevops_git_repository" "infra-repo" {
  project_id     = azuredevops_project.project.id
  name           = "infra"
  default_branch = "refs/heads/main"
  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = "https://github.com/markti/azdo-terraform-template-multi-stage.git"
  }
  lifecycle {
    ignore_changes = [
      # Ignore changes to initialization to support importing existing repositories
      # Given that a repo now exists, either imported into terraform state or created by terraform,
      # we don't care for the configuration of initialization against the existing resource
      initialization,
    ]
  }
}