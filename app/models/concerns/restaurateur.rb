class Restaurateur < User
  default_scope -> { with_role :restaurateur }
end