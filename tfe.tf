locals {
  tfe_org = try(data.tfe_organization.orgs[0], {})
  
  tfe_workspace_outputs = {
    for workspace_name, workspace_outputs in data.tfe_outputs.workspace_outputs :
        workspace_name => {
          for output_name, output_value in workspace_outputs.values :
              output_name => output_value
        }
  }
}

# Find Terraform Organization
data "tfe_organizations" "orgs" {
}

data "tfe_organization" "orgs" {
  for_each = data.tfe_organizations.orgs.ids
  
  name = each.value
}

data "tfe_workspace_ids" "workspaces" {
  organization = local.tfe_org.name
  
  names = ["*"]
}

data "tfe_outputs" "workspace_outputs" {
  for_each = data.tfe_workspace_ids.workspaces.full_names
  
  organization = local.tfe_org
  workspace = each.key
}
