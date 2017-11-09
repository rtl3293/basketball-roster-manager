class Team < ActiveRecord::Base
  belongs_to :coach
  has_many :players

  def team_stats
    players = self.players
    points = 0
    assists = 0
    rebounds = 0
    games = self.wins + self.losses
    players.each do |player|
      points += player.points
      assists += player.assists
      rebounds += player.rebounds
    end
    [points, assists, rebounds]
  end

  def total_games
    self.wins + self.losses
  end
end
