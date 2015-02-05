class AddMockRestaurateurToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :mock_restaurateur, :string
  end
end
