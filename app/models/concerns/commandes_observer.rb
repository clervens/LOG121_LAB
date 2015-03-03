module CommandesObserver
  extend ActiveSupport::Concern

  included do
    before_save :send_sms_on_etat_change
  end

private
  def send_sms_on_etat_change
    if etat_changed?
      SMS.send message: "Votre commande #{numero}, est maintenant à l'état : #{etat.humanize}"
    end
  end
end