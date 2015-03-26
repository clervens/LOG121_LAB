class RestaurateursController < ApplicationResourcesController
  before_action :set_restaurateur, only: [:show, :edit, :update, :destroy]

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurateur
      @restaurateur = Restaurateur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurateur_params
      params.require(:restaurateur).permit({adresses_attributes: [:id, :value]}, :nom, :prenom, :telephone, :date_de_naissance)
    end
end