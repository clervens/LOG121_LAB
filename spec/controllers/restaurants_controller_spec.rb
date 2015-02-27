require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  describe "GET index" do
    it "assigns @restaurants" do
      restaurant = FactoryGirl.create(:restaurant)
      get :index
      expect(assigns(:restaurants)).to eq([restaurant])
    end

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
  describe "GET #show" do
    it "assigns the requested contact to @restaurant" do
      restaurant = FactoryGirl.create(:restaurant)
      get :show, id: restaurant
      expect(assigns(:restaurant)).to eq(restaurant)
    end
    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:restaurant)
      expect(response).to render_template :show
    end
  end
  describe "POST create" do
    context "with valid attributes" do

      it "creates a new restaurant" do
        expect{ 
          post :create, restaurant: FactoryGirl.attributes_for(:restaurant)
        }.to change(Restaurant,:count).by(1)
      end

      it "redirects to the new restaurant" do
        post :create, restaurant: FactoryGirl.attributes_for(:restaurant)
        expect(response).to redirect_to(Restaurant.last)
      end

    end
  end
end