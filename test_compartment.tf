locals {
  test_compartment = oci_identity_compartment.test_compartment
  root_compartment = local.tfe_workspace_outputs.root_compartment.root_compartment
}

resource "oci_identity_compartment" "test_compartment" {
  provider = oci.home
  
  compartment_id = local.root_compartment.id
  
  name = "${local.root_compartment.name}-test"
  description = "${local.root_compartment.description} - Test Environment"
  
  enable_delete = local.root_compartment.enable_delete
  
  freeform_tags = merge({
    environment = "test"
  }, local.root_compartment.freeform_tags)
}
