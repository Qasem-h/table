class CreateOddTypes < ActiveRecord::Migration
  def change
    create_table :odd_types do |t|
      t.string :name
      t.references :match, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
