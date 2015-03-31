class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	# protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
	before_action :set_locale
  before_action :authenticate_user!, unless: :format_json
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_start_time

	def default_url_options(options={})
		{ :locale => I18n.locale == I18n.default_locale ? nil : I18n.locale  }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [{adresses_attributes: [:id, :value]}, :nom, :prenom, :telephone, :date_de_naissance]
    devise_parameter_sanitizer.for(:account_update) << [{adresses_attributes: [:id, :value]}, :nom, :prenom, :telephone, :date_de_naissance]
  end

  # Pour la gestion du user courant dans l'application native
  def current_user
    @current_user ||= if params[:cuid]
      User.find(params[:cuid])
    else
      super
    end
  end
  
	def set_start_time
    @start_time = Time.now.usec
  end

private
	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
  end

  def format_json
    request.format.json?
  end

end
