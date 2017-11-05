class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :points
      t.integer :assists
      t.integer :rebounds
      t.integer :games
      t.integer :minutes
      t.integer :team_id
      t.timestamps null: false
    end
  end
end
