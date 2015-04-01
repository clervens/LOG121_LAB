class RestaurateursController < ApplicationResourcesController
  before_action :set_restaurateur, only: [:show, :edit, :update, :destroy]

  def create
    @restaurateur = Restaurateur.new restaurateur_params
    @restaurateur.add_role :restaurateur

    create! do |success, failure|
      success.html {
        if params[:restaurateur][:restaurants]
          restaurant = Restaurant.find(params[:restaurateur][:restaurants])
          restaurant.restaurateur = @restaurateur
          restaurant.save
        end
        redirect_to restaurateurs_url, notice: "Le Restaurateur à été créée"
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurateur
      @restaurateur = Restaurateur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurateur_params
      params.require(:restaurateur).permit({adresses_attributes: [:id, :value]}, :email, :password, :password_confirmation, :nom, :prenom, :telephone, :date_de_naissance)
    end
end