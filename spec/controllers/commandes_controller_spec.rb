require 'rails_helper'

RSpec.describe CommandesController, type: :controller do
  before do
    sign_in FactoryGirl.create(:admin)
  end
  describe "GET index" do
    it "assigns @commandes" do
      commande = FactoryGirl.create(:commande)
      get :index
      expect(assigns(:commandes)).to eq([commande])
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
    it "assigns the requested contact to @commande" do
      commande = FactoryGirl.create(:commande)
      get :show, id: commande
      expect(assigns(:commande)).to eq(commande)
    end
    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:commande)
      expect(response).to render_template :show
    end
  end
  describe "POST create" do
    context "with valid attributes" do

      it "creates a new commande" do
        expect{ 
          post :create, commande: FactoryGirl.attributes_for(:commande, adresse_id: 1, restaurant_id: 1)
        }.to change(Commande,:count).by(1)
      end

      it "redirects to the new commande" do
        post :create, commande: FactoryGirl.attributes_for(:commande, adresse_id: 1, restaurant_id: 1)
        expect(response).to redirect_to(Commande.last)
      end

    end
  end
end