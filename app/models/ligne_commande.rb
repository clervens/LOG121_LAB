# == Schema Information
#
# Table name: ligne_commandes
#
#  id          :integer          not null, primary key
#  qte         :integer
#  commande_id :integer
#  plat_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_ligne_commandes_on_commande_id  (commande_id)
#  index_ligne_commandes_on_plat_id      (plat_id)
#

class LigneCommande < ActiveRecord::Base
	## Associations ##

  belongs_to :commande, touch: true
  belongs_to :plat

  def prix
    self.qte * plat.prix
  end
end
