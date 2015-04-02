# == Schema Information
#
# Table name: plats
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :string(255)
#  prix        :decimal(, )
#  menu_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_plats_on_menu_id  (menu_id)
#

class Plat < ActiveRecord::Base

	## Validations ##

	validates :nom, :prix, presence: true, allow_blank: false
	validates :prix, numericality: true
	
	## Associations ##
  	
  belongs_to :menu

  def desc
    sleep 0.0005
    description.truncate(10)
  end
end
