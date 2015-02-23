class CreateAdresses < ActiveRecord::Migration
  def change
    create_table :adresses do |t|
      t.string :value
      t.references :user, index: true

      t.timestamps
    end
  end

end
