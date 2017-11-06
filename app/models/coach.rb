class Coach < ActiveRecord::Base
  has_secure_password
  has_one :team
  has_many :players, through: :teams
end
