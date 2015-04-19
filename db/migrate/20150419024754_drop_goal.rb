class DropGoal < ActiveRecord::Migration
def up
    drop_table :goals
  end
end