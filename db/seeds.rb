sixers_players = [Player.create(name: "Ben", points: 178, assists: 80, rebounds: 101, games: 10, minutes: 353),
Player.create(name: "Joel", points: 164, assists: 29, rebounds: 81, games: 8, minutes: 221),
Player.create(name: "JJ", points: 125, assists: 27.2, rebounds: 23, games: 8, minutes: 262.4),
Player.create(name: "Jerryd", points: 99, assists: 25.2, rebounds: 18, games: 9, minutes: 280),
Player.create(name: "RoCo", points: 153, assists: 14, rebounds: 57, games: 10, minutes: 305)]

celtics_players = [Player.create(name: "Kyrie", points: 264, assists: 92, rebounds: 61, games: 12, minutes: 401),
Player.create(name: "Marcus", points: 165, assists: 21, rebounds: 98, games: 12, minutes: 383),
Player.create(name: "Jaylen", points: 160, assists: 53, rebounds: 76, games: 12, minutes: 362),
Player.create(name: "Al", points: 160, assists: 46, rebounds: 80, games: 10, minutes: 350),
Player.create(name: "Jayson", points: 155, assists: 40, rebounds: 76, games: 11,minutes: 365)]

Player.create(name: "Lebron")
Player.create(name: "Russ")
Player.create(name: "KD")
Player.create(name: "Boogie")
Player.create(name: "DWade")



sixers = Team.create(team_name: "Sixers")
celtics = Team.create(team_name: "Celtics")
Team.create(team_name: "All-NBA")


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
