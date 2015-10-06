class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :stake
      t.integer :winnings

      t.timestamps null: false
    end
  end
end
