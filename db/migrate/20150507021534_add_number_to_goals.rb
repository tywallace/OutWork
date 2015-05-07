class AddNumberToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :number, :integer
  end
end
