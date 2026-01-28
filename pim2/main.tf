resource "azuread_group" "pim" {
  display_name = "pim-privileged"
  security_enabled = true
}

module "pim_role_assignment" {
  source         = "./modules/pim_role_assignment"
  group_object_id = azuread_group.pim.object_id
  role_names      = var.roles_list
  scope           = data.azurerm_subscription.current.id
  activation_rules = {
    require_justification              = false
    require_approval                   = false
    require_multifactor_authentication = true
    maximum_duration                   = "PT4H"
  }
}
