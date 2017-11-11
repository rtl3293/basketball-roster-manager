class Team < ActiveRecord::Base
  belongs_to :coach
  has_many :players
  validates_length_of :players, maximum: 5

  def update_roster(params)
    self.players.clear
    new_roster = params.collect do |player|
      if Player.find_by(name: player)
        player = Player.find_by(name: player)
      else
        new_players = player.split(", ")
        binding.pry
        new_players.each do |new_player|
          player = Player.create(name: new_player)
          player.team = self
          player.save
        end
        binding.pry
      end
      player.team = self
      player.save
    end
    new_roster
  end

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
