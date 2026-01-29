activation_rules = {
  Owner = {
    require_justification              = true
    require_approval                   = true
    require_multifactor_authentication = true
    maximum_duration                   = "PT2H"
  }
  Contributor = {
    require_justification              = false
    require_approval                   = false
    require_multifactor_authentication = true
    maximum_duration                   = "PT4H"
  }
  Reader = {
    require_justification              = false
    require_approval                   = false
    require_multifactor_authentication = false
    maximum_duration                   = "PT8H"
  }
  "Lab Creator" = {
    require_justification              = false
    require_approval                   = false
    require_multifactor_authentication = true
    maximum_duration                   = "PT4H"
  }
  "DevTest Labs User" = {
    require_justification              = false
    require_approval                   = false
    require_multifactor_authentication = false
    maximum_duration                   = "PT4H"
  }
}
