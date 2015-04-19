class RemoveGoalFromLog < ActiveRecord::Migration
  def change
  	remove_column :logs, :goal
  end
end
