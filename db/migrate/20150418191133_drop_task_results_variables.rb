class DropTaskResultsVariables < ActiveRecord::Migration
  def change
		remove_column :logs, :task
		remove_column :logs, :result
  end
end
