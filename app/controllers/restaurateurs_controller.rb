class RestaurateursController < ApplicationResourcesController
  defaults :resource_class => User
  before_action :set_restaurateur, only: [:show, :edit, :update, :destroy]

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurateur
      @restaurateur = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurateur_params
      # devise_parameter_sanitizer.for(:account_update)
      params.require(:user).permit(:nom, :adresse, :mock_restaurateur)
    end
end