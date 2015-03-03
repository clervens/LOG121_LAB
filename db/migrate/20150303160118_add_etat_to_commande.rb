class AddEtatToCommande < ActiveRecord::Migration
  def change
    add_column :commandes, :etat, :integer, default: 0
  end
end
