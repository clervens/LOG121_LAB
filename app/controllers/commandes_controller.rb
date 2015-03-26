class CommandesController < ApplicationResourcesController
  before_filter :set_cors_fix
  after_action :send_mail, only: :create
  protect_from_forgery except: [:hook]
  skip_before_action :authenticate_user!, only: :hook
  
  def create
    @commande = current_user.commandes.build commande_params
    if @commande.save
      redirect_to paypal_url(commande_demarrer_path(@commande))
    else
      super
    end
  end

  def hook
    # SOURCE: http://www.gotealeaf.com/blog/basic-paypal-checkout-processing-in-rails
    params.permit!
    status = params[:payment_status]
    if status == "Completed" and params[:invoice] == params[:commande_id]
      @commande = Commande.find(params[:invoice])
      @commande.paye
    end
    render nothing: true
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
      params.require(:commande).permit({adresse_attributes: [:value]},{ligne_commandes_attributes: [:id, :qte, :plat_id, :_destroy]}, :numero, :date_de_livraison, :restaurant_id, :adresse_id, :etat)
    end

    def send_mail
      # CommandeMailer.confirmation(@commande).deliver
    end

    def set_cors_fix
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end

    def paypal_url(return_path)
      values = {
          business: "log210_e10_b@etsmtl.net",
          cmd: "_xclick",
          upload: 1,
          return: commande_url(@commande),
          invoice: @commande.id,
          amount: @commande.total,
          item_name: "#{@commande.restaurant.nom} | Commande [log210_e10@etsmtl.net:qwerty123]",
          item_number: @commande.numero,
          quantity: '1',
          notify_url: "#{ENV['NGROK_TUNNEL']||request.host_with_port}#{return_path}"
      }
      "https://www.sandbox.paypal.com/cgi-bin/webscr?#{values.to_query}"
    end
end

