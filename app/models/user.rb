# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  nom                    :string(255)
#  prenom                 :string(255)
#  telephone              :string(255)
#  date_de_naissance      :date
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable

  ## Validations ##

  validates :nom, :prenom, presence: true, allow_blank: false

  ## Associations ##

  has_many :commandes
  has_many :livraisons
  has_many :adresses
  accepts_nested_attributes_for :adresses, :reject_if => :all_blank
  has_many :restaurants

  ## Callbacks ##

  before_create :set_default_role

  def nom_complet
    "#{nom.capitalize}, #{prenom.capitalize}"
  end

  private
  def set_default_role
    self.add_role :client if self.roles.empty?
  end

end
