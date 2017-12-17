class RenameColumnFromSimply < ActiveRecord::Migration[5.1]
  def change
    rename_column :simplies, :address, :addr
  end
end
