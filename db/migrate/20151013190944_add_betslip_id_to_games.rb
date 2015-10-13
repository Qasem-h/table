class AddBetslipIdToGames < ActiveRecord::Migration
  def up
    add_reference :games, :betslip, index: true
    remove_column :games, :stake
    add_money :games, :stake, currency: { present: false }
  end

  def down
    remove_money :games, :stake, currency: { present: false }
    add_column :games, :stake, :integer
    remove_reference :games, :betslip
  end
end
