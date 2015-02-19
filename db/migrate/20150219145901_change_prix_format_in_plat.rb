class ChangePrixFormatInPlat < ActiveRecord::Migration
  def up
    change_column :plats, :prix, :decimal
  end

  def down
    change_column :plats, :prix, :integer
  end
end
