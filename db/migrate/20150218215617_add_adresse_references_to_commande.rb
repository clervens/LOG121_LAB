class AddAdresseReferencesToCommande < ActiveRecord::Migration
  def change
    add_reference :commandes, :adresse, index: true
  end
end
