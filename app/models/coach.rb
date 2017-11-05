class Coach < ActiveRecord::Base
  has_one :team
  has_many :players, through: :teams
end
