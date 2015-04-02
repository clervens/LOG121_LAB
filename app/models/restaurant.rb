# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  nom        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  adresse    :string(255)      default("?")
#  user_id    :integer
#
# Indexes
#
#  index_restaurants_on_user_id  (user_id)
#

class Restaurant < ActiveRecord::Base
	alias_attribute :restaurateur, :user
	# RESTAURATEURS = %w(batman bob jack mike mobby)

	## Validations ##

	validates :nom, presence: true

	## Associations ##

	belongs_to :user

	has_many :menus, dependent: :destroy
	has_many :commandes, dependent: :destroy
	has_many :livraisons, through: :commandes
end
