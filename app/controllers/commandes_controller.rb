class CommandesController < ApplicationResourcesController
  before_filter :set_cors_fix
  def create
    @commande = current_user.commandes.build commande_params
    super
  end

  def pretes
    @commandes = Commande.where(etat: Commande.etats[:prete])
    @livraison = Livraison.new
  end

  def get_map
    @restaurant = Commande.find(params[:commande_id]).restaurant
    @livraison = Livraison.new :commande_id => params[:commande_id], :user_id => current_user.id, :adresse => params[:adresse]
    @form_livraison = render_to_string(:action => "form_livraison.html", :layout => false)
    render json: {form: @form_livraison}
  end

  private

    def commande_params
      params.require(:commande).permit({ligne_commandes_attributes: [:id, :qte, :plat_id, :_destroy]}, :numero, :date_de_livraison, :restaurant_id, :adresse_id, :etat)
    end

    def set_cors_fix
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
end

