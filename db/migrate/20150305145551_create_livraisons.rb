class CreateLivraisons < ActiveRecord::Migration
  def change
    create_table :livraisons do |t|
      t.references :commande, index: true
      t.references :user, index: true
      t.text :adresse

      t.timestamps
    end
  end
end
