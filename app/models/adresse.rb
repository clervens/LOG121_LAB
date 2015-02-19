# == Schema Information
#
# Table name: adresses
#
#  id         :integer          not null, primary key
#  value      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_adresses_on_user_id  (user_id)
#

class Adresse < ActiveRecord::Base
  belongs_to :user
end
