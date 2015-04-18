class AddGoalsVariables < ActiveRecord::Migration
  def change
  	 add_column :logs, :goal, :string
  end
end
