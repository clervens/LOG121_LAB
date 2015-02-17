class CreateCommandes < ActiveRecord::Migration
  def change
    create_table :commandes do |t|
      t.string :numero
      t.datetime :date_de_livraison
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
