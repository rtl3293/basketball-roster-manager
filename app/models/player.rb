class Player < ActiveRecord::Base
  belongs_to :team
  has_one :coach, through: :team
  validates_associated :team

  
  def update_stats(params)
    self.points += params["points"].to_i if params["points"] != ""
    self.assists += params["assists"].to_i if params["assists"] != ""
    self.rebounds += params["rebounds"].to_i if params["rebounds"] != ""
    self.games += params["games"].to_i if params["games"] != ""
    self.minutes += params["minutes"].to_i if params["minutes"] != ""
    self.save
  end
end
