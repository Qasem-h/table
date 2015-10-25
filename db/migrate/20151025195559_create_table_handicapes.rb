class CreateTableHandicapes < ActiveRecord::Migration
  def change
    create_table :table_handicapes do |t|
      t.string :name
      t.decimal :value
      t.string :handicape_type
      t.references :bookmaker

      t.timestamps null: false
    end
  end
end
