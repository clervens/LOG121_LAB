require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'can be instanciated' do
    before do
      @restaurant = FactoryGirl.create(:restaurant)
    end

    it 'and have menus' do
      @restaurant = FactoryGirl.create(:restaurant_with_menus, :menus_count => 10)
      expect(@restaurant.menus.count).to eq 10
    end
  end
  describe 'should be able to interact with mock_restaurateur' do
    it 'by responding to it' do
      restaurant = FactoryGirl.create(:restaurant)
      expect(restaurant).to respond_to(:mock_restaurateur)
    end
    it 'by setting it' do
      restaurateur_name = 'alfred'
      restaurant = FactoryGirl.create(:restaurant, mock_restaurateur: restaurateur_name)
      expect(restaurant.mock_restaurateur).to eq(restaurateur_name)
    end
    it 'through the alias restaurateur' do
      restaurateur_name = 'alfred'
      restaurant = FactoryGirl.create(:restaurant, mock_restaurateur: restaurateur_name)
      expect(restaurant.mock_restaurateur).to eq(restaurant.restaurateur)
    end
  end
end
