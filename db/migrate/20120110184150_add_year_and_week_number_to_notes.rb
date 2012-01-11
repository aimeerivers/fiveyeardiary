class AddYearAndWeekNumberToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :year, :integer
    add_column :notes, :week_number, :integer

    add_index :notes, :year
    add_index :notes, :week_number
  end
end
