# == Schema Information
#
# Table name: commandes
#
#  id                :integer          not null, primary key
#  numero            :string(255)
#  date_de_livraison :datetime
#  restaurant_id     :integer
#  created_at        :datetime
#  updated_at        :datetime
#
# Indexes
#
#  index_commandes_on_restaurant_id  (restaurant_id)
#

class Commande < ActiveRecord::Base
  belongs_to :restaurant
end
