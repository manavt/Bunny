class RemoveColumnFromSimply < ActiveRecord::Migration[5.1]
  def change
    remove_column :simplies, :addr, :string
  end
end
