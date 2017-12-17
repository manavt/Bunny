class DropTableSimply < ActiveRecord::Migration[5.1]
  def change
    drop_table :simplies
  end
end
