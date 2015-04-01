class Restaurateur < User
  ## Scopes ##

  default_scope -> { with_role :restaurateur }
end