locals {
  test_compartment = oci_identity_compartment.test_compartment
  root_compartment = local.tfe_workspace_outputs.root_compartment.root_compartment
}

resource "oci_identity_compartment" "test_compartment" {
  provider = oci.home
  
  compartment_id = var.oci_tenancy_id
  
  name = "${local.root_compartment.name}-test"
  description = "Sisal Fan Club"
  
  enable_delete = true
  
  freeform_tags = {
    factory = "digital"
    app_code = "nsfc"
    managed-by = "Terraform Cloud"
    terraform-cloud-workspace = "Sisal-Fan-Club/root_compartment"
  }
}
