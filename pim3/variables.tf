variable "roles_list" {
  description = "List of roles to assign via PIM"
  type        = list(string)
  default     = ["Owner", "Contributor", "Reader", "Lab Creator", "DevTest Labs User"]
}

variable "activation_rules" {
  type = map(object({
    require_justification              = bool
    require_approval                   = bool
    require_multifactor_authentication = bool
    maximum_duration                   = string
  }))
}