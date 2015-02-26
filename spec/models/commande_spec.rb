require 'rails_helper'

RSpec.describe Commande, type: :model do
  describe 'can be instanciated' do
    before do
      @commande = FactoryGirl.create(:commande)
    end

    it 'and have lines' do
      @commande = FactoryGirl.create(:commande_with_ligne_commandes, :lignes_count => 10)
      expect(@commande.ligne_commandes.count).to eq 10
    end
  end

  it 'should be able to calculate the total' do
    commande = FactoryGirl.create(:commande_with_ligne_commandes)
    total = 0

    commande.ligne_commandes.each do |lc|
      total += lc.qte * lc.plat.prix
    end
    total

    expect(commande.total).to eq(total)
  end

  describe 'can\'t be instanciated' do
    it 'if date_de_livraison is in the past' do
      commande = FactoryGirl.build(:commande, date_de_livraison: 1.day.ago)
      expect(commande.valid?).to be_falsey
      expect(commande.errors[:date_de_livraison].size).to eq(1)
    end
  end
end
