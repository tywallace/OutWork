class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.date :date
      t.text :goal
      t.text :actual

      t.timestamps
    end
  end
end
