# == Schema Information
#
# Table name: livraisons
#
#  id          :integer          not null, primary key
#  commande_id :integer
#  user_id     :integer
#  adresse     :text
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_livraisons_on_commande_id  (commande_id)
#  index_livraisons_on_user_id      (user_id)
#

class Livraison < ActiveRecord::Base

  ## Associations ##

  belongs_to :commande
  belongs_to :user

  ## Validations ##

  validates :commande_id, uniqueness: {message: " : Une livraison est déjà en cours"}

  ## Callbacks ##

  after_create :change_etat_commande

private
  
  def change_etat_commande
    self.commande.debuter_livraison
  end

end
