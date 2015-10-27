class RemoveAttributesFromBookmaker < ActiveRecord::Migration
  def up
    remove_column :bookmakers, :under
    remove_column :bookmakers, :over
  end

  def down
    add_column :bookmakers, :under, :decimal
    add_column :bookmakers, :over, :decimal
  end
end
