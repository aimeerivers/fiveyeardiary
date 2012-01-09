class AddWeekDayToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :week_day, :integer
    add_index :notes, :week_day
  end
end
