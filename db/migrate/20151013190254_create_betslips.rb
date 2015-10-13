class CreateBetslips < ActiveRecord::Migration
  def change
    create_table :betslips do |t|
      t.money :winnings, currency: { present: false }

      t.timestamps null: false
    end
  end
end
