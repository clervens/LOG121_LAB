class AddUserRefToCommande < ActiveRecord::Migration
  def change
    add_reference :commandes, :user, index: true
  end
end
