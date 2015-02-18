class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :nom
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
