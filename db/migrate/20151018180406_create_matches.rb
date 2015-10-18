class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :static_id
      t.string :alternate_id
      t.datetime :play_date
      t.string :hometeam
      t.string :awayteam
      t.references :league

      t.timestamps null: false
    end
  end
end
