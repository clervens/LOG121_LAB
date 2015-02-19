class CreateAdresses < ActiveRecord::Migration
  def change
    create_table :adresses do |t|
      t.string :value
      t.references :user, index: true

      t.timestamps
    end
    [
    	"1100 rue Notre-Dame Ouest, Montréal, QC H3C 1K3",
    	"1111 rue Notre-Dame Ouest, Montréal, QC H3C 6M8",
    	"1909 Avenue des Canadiens-de-Montréal, Montréal, QC H4B 5G0",
    	"845 Rue Sherbrooke O, Montréal, QC H3A 0G4",
    	"4777 Avenue Pierre-de Coubertin, Montréal, QC H1V 1B3"
    ].each do |address|
    	Adresse.create(value: address)
    end
  end

end
