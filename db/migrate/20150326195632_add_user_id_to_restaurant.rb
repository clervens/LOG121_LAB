class AddUserIdToRestaurant < ActiveRecord::Migration
  def change
    remove_column :restaurants, :mock_restaurateur
    add_reference :restaurants, :user, index: true
  end
end
