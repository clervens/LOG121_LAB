require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  before do
    @restaurant = FactoryGirl.create(:restaurant_with_menus)
    sign_in FactoryGirl.create(:admin)
  end
  describe "GET index" do
    it "assigns @menus" do
      get :index, restaurant_id: @restaurant
      expect(assigns(:menus)).to eq(@restaurant.menus)
    end

    it "has a 200 status code" do
      get :index, restaurant_id: @restaurant
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index, restaurant_id: @restaurant
      expect(response).to render_template("index")
    end
  end
  describe "GET #show" do
    it "assigns the requested contact to @menu" do
      menu = @restaurant.menus.first
      get :show, id: menu, restaurant_id: @restaurant
      expect(assigns(:menu)).to eq(menu)
    end
    it "renders the #show view" do
      get :show, id: @restaurant.menus.first, restaurant_id: @restaurant
      expect(response).to render_template :show
    end
  end
  describe "POST create" do
    context "with valid attributes" do

      it "creates a new menu" do
        expect{ 
          post :create, menu: FactoryGirl.attributes_for(:menu, restaurant_id: @restaurant), restaurant_id: @restaurant
        }.to change(Menu,:count).by(1)
      end

      it "redirects to the new menu" do
        post :create, menu: FactoryGirl.attributes_for(:menu, restaurant_id: @restaurant), restaurant_id: @restaurant
        expect(response).to redirect_to([@restaurant, @restaurant.menus.last])
      end

    end
  end
end
