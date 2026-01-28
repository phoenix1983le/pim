data "azurerm_role_definition" "builtin" {
  for_each = toset(var.role_names)
  name     = each.value
}

resource "azurerm_role_management_policy" "policy" {
  for_each = data.azurerm_role_definition.builtin

  role_definition_id = each.value.id
  scope              = var.scope

  eligible_assignment_rules {
    expiration_required = false
  }

  activation_rules {
    require_justification              = var.activation_rules.require_justification
    require_approval                   = var.activation_rules.require_approval
    require_multifactor_authentication = var.activation_rules.require_multifactor_authentication
    maximum_duration                   = var.activation_rules.maximum_duration
  }

  lifecycle {
    ignore_changes = [
      activation_rules.0.approval_stage
    ]
  }
}

resource "azurerm_pim_eligible_role_assignment" "assignment" {
  for_each = data.azurerm_role_definition.builtin

  principal_id       = var.group_object_id
  role_definition_id = each.value.id
  scope              = var.scope

  schedule {
    start_date_time = timestamp()
  }
}
