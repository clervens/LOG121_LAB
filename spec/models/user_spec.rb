require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'can be a entrepreneur' do
    before do
      @entrepreneur = FactoryGirl.create(:entrepreneur)
    end

    it 'and have the entrepreneur role' do
      @entrepreneur.has_role? :entrepreneur
    end
  end
  describe 'can be a restaurateur' do
    before do
      @restaurateur = FactoryGirl.create(:restaurateur)
    end

    it 'and have the restaurateur role' do
      @restaurateur.has_role? :restaurateur
    end
  end
  describe 'can be a livreur' do
    before do
      @livreur = FactoryGirl.create(:livreur)
    end

    it 'and have the livreur role' do
      @livreur.has_role? :livreur
    end
  end
  describe 'can be a client' do
    before do
      @client = FactoryGirl.create(:client)
    end

    it 'and have the client role' do
      @client.has_role? :client
    end
  end
end
