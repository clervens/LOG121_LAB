# == Schema Information
#
# Table name: restaurants
#
#  id                :integer          not null, primary key
#  nom               :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  mock_restaurateur :string(255)
#

class Restaurant < ActiveRecord::Base
	before_validation :nilify_restaurateur
	RESTAURATEURS = %w(batman bob jack mike mobby)

	def restaurateur
		mock_restaurateur
	end
private

	def nilify_restaurateur
		self.mock_restaurateur = nil if mock_restaurateur.blank?
	end
end
