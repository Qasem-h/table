class AddMatchIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :match_id, :string
  end
end
