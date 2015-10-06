class AddDetailsToGames < ActiveRecord::Migration
  def change
    add_column :games, :home, :string
    add_column :games, :away, :string
    add_column :games, :type, :string
    add_column :games, :bet, :string
  end
end
