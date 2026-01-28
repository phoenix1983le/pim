variable "roles_list" {
  description = "List of roles to assign via PIM"
  type        = list(string)
  default     = ["Owner", "Contributor", "Reader", "Lab Creator", "DevTest Labs User"]
}
