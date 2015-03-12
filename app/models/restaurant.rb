# == Schema Information
#
# Table name: restaurants
#
#  id                :integer          not null, primary key
#  nom               :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  mock_restaurateur :string(255)
#  adresse           :string(255)      default("?")
#

class Restaurant < ActiveRecord::Base
	before_validation :nilify_restaurateur
	RESTAURATEURS = %w(batman bob jack mike mobby)

	## Validations ##

	validates :nom, presence: true

	## Associations ##

	has_many :menus
	has_many :commandes
	has_many :livraisons, through: :commandes

	def restaurateur
		mock_restaurateur
	end
private

	def nilify_restaurateur
		self.mock_restaurateur = nil if mock_restaurateur.blank?
	end
end
