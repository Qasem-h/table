class CreateTableOverUnderTotalValues < ActiveRecord::Migration
  def change
    create_table :over_under_total_values do |t|
      t.references :bookmaker
      t.string :name
      t.decimal :under
      t.decimal :over

      t.timestamps null: false
    end
  end
end
