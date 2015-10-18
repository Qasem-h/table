class CreateBookmakers < ActiveRecord::Migration
  def change
    create_table :bookmakers do |t|
      t.references :odd_type, index: true, foreign_key: true
      t.integer :api_id
      t.string :name
      t.decimal :home_win
      t.decimal :away_win
      t.decimal :draw

      t.timestamps null: false
    end
  end
end
