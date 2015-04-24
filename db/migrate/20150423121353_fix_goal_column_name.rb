class FixGoalColumnName < ActiveRecord::Migration
  def change
  	rename_column :goals, :goal, :content
  end
end
