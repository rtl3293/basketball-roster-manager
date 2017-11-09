class Player < ActiveRecord::Base
  belongs_to :team
  has_one :coach, through: :team
  validates_associated :team

  def update_stats(params)
    self.points += params["points"]
    self.assists += params["assists"]
    self.rebounds += params["rebounds"]
    self.games += params["games"]
    self.minutes += params["minutes"]
  end
end
