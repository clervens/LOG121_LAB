class AddDateDeNaissanceToUser < ActiveRecord::Migration
  def change
    add_column :users, :date_de_naissance, :date
  end
end
