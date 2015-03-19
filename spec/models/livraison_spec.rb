require 'rails_helper'

RSpec.describe Livraison, type: :model do
  describe 'can be instanciated' do
    before do
      @livraison = FactoryGirl.create(:livraison)
    end

    it 'and have a commande' do
      expect(@livraison.commande).to eq 10
    end
  end

  describe 'should respond to' do
    before do
      @livraison = FactoryGirl.create :livraison
    end

    it 'commande' do
      expect(@livraison).to respond_to(:commande)
    end

    it 'user' do
      expect(@livraison).to respond_to(:user)
    end
  end

  describe 'can\'t be instanciated' do
    it 'if a livraison is already linked to this livraison' do
      l = FactoryGirl.create(:livraison)
      put l.as_json
      livraison = FactoryGirl.create(:livraison, commande_id: l.commande.id)
      expect(livraison.valid?).to be_falsey
      expect(livraison.errors[:commande].size).to eq(1)
    end
  end
end
