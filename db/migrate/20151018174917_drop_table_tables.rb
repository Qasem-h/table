class DropTableTables < ActiveRecord::Migration
  def up
    drop_table :tables
  end

  def down
    create_table :tables do |t|

      t.timestamps null: false
    end
  end
end
