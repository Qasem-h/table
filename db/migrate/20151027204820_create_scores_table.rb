class CreateScoresTable < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :match
      t.integer :ht_home_goal
      t.integer :ht_away_goal
      t.integer :ft_home_goal
      t.integer :ft_away_goal

      t.timestamps
    end
  end
end
