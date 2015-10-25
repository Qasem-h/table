class AddFieldsToBookmaker < ActiveRecord::Migration
  def change
    add_column :bookmakers, :under, :decimal
    add_column :bookmakers, :over, :decimal
  end
end
