class RenameTableHandicapes < ActiveRecord::Migration
  def change
    rename_table :table_handicapes, :handicapes
  end
end
