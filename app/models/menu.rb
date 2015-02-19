# == Schema Information
#
# Table name: menus
#
#  id            :integer          not null, primary key
#  nom           :string(255)
#  restaurant_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_menus_on_restaurant_id  (restaurant_id)
#

class Menu < ActiveRecord::Base

	## Validations ##

	validates :nom, :restaurant_id, presence: true

	## Associations ##

	belongs_to :restaurant
	has_many :plats
	accepts_nested_attributes_for :plats, :reject_if => :all_blank, :allow_destroy => true

	## Scopes ##

	default_scope -> { includes(:plats, :restaurant) }
end
