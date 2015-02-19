class CreatePlats < ActiveRecord::Migration
  def change
    create_table :plats do |t|
      t.string :nom
      t.string :description
      t.decimal :prix
      t.references :menu, index: true

      t.timestamps
    end
  end
end
