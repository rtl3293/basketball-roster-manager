sixers_players = [Player.create(name: "Ben"),
Player.create(name: "Joel"),
Player.create(name: "Markelle"),
Player.create(name: "TJ"),
Player.create(name: "RoCo")]

celtics_players = [Player.create(name: "Kyrie"),
Player.create(name: "Marcus"),
Player.create(name: "Jaylen"),
Player.create(name: "Al"),
Player.create(name: "Jayson")]


sixers = Team.create(team_name: "Sixers")
celtics = Team.create(team_name: "Celtics")


sixers.coach = Coach.create(name: "Brett Brown", username: "coachbrown", password:"sixerscoach")
celtics.coach = Coach.create(name: "Brad Stevens", username: "coachstevens", password:"celticscoach")

sixers_players.each do |player|
  player.team = sixers
  player.save
end

celtics_players.each do |player|
  player.team = celtics
  player.save
end

sixers.save
celtics.save
