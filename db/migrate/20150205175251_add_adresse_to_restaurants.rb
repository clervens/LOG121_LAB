class AddAdresseToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :adresse, :string, default: "?"
  end
end
