class Player < ActiveRecord::Base
  belongs_to :team
  has_one :coach, through: :team
  validates_associated :team

end
