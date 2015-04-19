class AddResultsToLog < ActiveRecord::Migration
  def change
  	add_column :logs, :result, :boolean
  end
end
