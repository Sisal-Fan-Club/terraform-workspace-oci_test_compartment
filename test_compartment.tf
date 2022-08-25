locals {
  test_compartment = oci_identity_compartment.test_compartment
}

resource "oci_identity_compartment" "test_compartment" {
  provider = oci.home
  
  compartment_id = var.oci_tenancy_id
  
  name = "sisal-fan-club"
  description = "Sisal Fan Club"
  
  enable_delete = true
  
  freeform_tags = {
    factory = "digital"
    app_code = "nsfc"
    managed-by = "Terraform Cloud"
    terraform-cloud-workspace = "Sisal-Fan-Club/root_compartment"
  }
}
