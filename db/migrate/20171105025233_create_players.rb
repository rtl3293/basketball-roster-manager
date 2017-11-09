class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :points, :default => 0
      t.integer :assists, :default => 0
      t.integer :rebounds, :default => 0
      t.integer :games, :default => 0
      t.integer :minutes, :default => 0
      t.integer :team_id
      t.timestamps null: false
    end
  end
end
