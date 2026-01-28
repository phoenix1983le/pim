variable "group_object_id" {
  description = "Object ID of the privileged Azure AD group"
  type        = string
}

variable "role_names" {
  description = "List of role names to assign"
  type        = list(string)
}

variable "scope" {
  description = "Scope for the role assignment (e.g., subscription ID)"
  type        = string
}

variable "activation_rules" {
  description = "Activation rules for PIM assignment"
  type = object({
    require_justification              = bool
    require_approval                   = bool
    require_multifactor_authentication = bool
    maximum_duration                   = string
  })
}
