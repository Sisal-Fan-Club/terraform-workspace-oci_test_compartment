locals {
  tfe_org = try(data.tfe_organization.orgs[0], {})
  tfe_workspaces = try(data.tfe_organization.workspaces.ids, {})
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
  
  names = [*]
}
