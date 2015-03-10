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
#  adresse_id        :integer
#  etat              :integer          default(0)
#  user_id           :integer
#
# Indexes
#
#  index_commandes_on_adresse_id     (adresse_id)
#  index_commandes_on_restaurant_id  (restaurant_id)
#  index_commandes_on_user_id        (user_id)
#

class Commande < ActiveRecord::Base
  include CommandesObserver
  enum etat: [ :demarrer, :en_preparation, :prete, :en_cours_de_livraison, :livre ]

  ## Validdations ##

  validates :restaurant_id, :date_de_livraison, presence: true, allow_blank: false
  validate :expiration_date_cannot_be_in_the_past

	## Associations ##
  
  belongs_to :restaurant
  has_many :ligne_commandes, dependent: :destroy
  belongs_to :adresse
  accepts_nested_attributes_for :ligne_commandes, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :adresse, :reject_if => lambda {|adresse| adresse.all? { |k, v| v.blank?  } }
  belongs_to :user

  ## Scopes ##

  default_scope -> { includes(:ligne_commandes)}

  ## Callbacks ##

  before_create :generate_conf_number


  def total
    total = 0

    ligne_commandes.each do |lc|
      total += lc.qte * lc.plat.prix
    end
    total
  end

private

	def generate_conf_number
		self.numero = SecureRandom.hex 10
	end

  def expiration_date_cannot_be_in_the_past
    if date_de_livraison.present? && date_de_livraison < 1.hour.ago
      errors.add(:date_de_livraison, "ne peut être dans le passé")
    end
  end
end
