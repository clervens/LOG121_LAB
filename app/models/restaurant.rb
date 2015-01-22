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
end
