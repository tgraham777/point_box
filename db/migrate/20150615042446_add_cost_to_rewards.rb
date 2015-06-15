class AddCostToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :cost, :integer
  end
end
