class CommandeMailer < ApplicationMailer
  def confirmation(commande)
    @commande = commande
    @user = @commande.user
    @restaurant = @commande.restaurant
    mail(to: @user.email, subject: "Commande ##{commande.numero}")
  end
end