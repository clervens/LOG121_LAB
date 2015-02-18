class CreateLigneCommandes < ActiveRecord::Migration
  def change
    create_table :ligne_commandes do |t|
      t.integer :qte
      t.references :commande, index: true
      t.references :plat, index: true

      t.timestamps
    end
  end
end
