class AddInformationsToUser < ActiveRecord::Migration
  def change
    add_column :users, :nom, :string
    add_column :users, :prenom, :string
    add_column :users, :telephone, :string
  end
end
