module CommandesObserver
  extend ActiveSupport::Concern

  included do
    before_save :send_sms_on_etat_change
  end

private
  def send_sms_on_etat_change
    if etat_changed? and !ENV['SKIP_SMS'].present? and user.telephone
      SMS.send to: user.telephone, message: "Votre commande #{numero}, est maintenant à l'état : #{etat.humanize}"
    end
  end
end