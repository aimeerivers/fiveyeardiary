class RenameYearAndWeekToIso8601 < ActiveRecord::Migration
  def up
    remove_index :notes, :year
    remove_index :notes, :week_number
    rename_column :notes, :year, :iso_8601_year
    rename_column :notes, :week_number, :iso_8601_week_number
    add_index :notes, :iso_8601_year
    add_index :notes, :iso_8601_week_number
  end

  def down
    remove_index :notes, :iso_8601_year
    remove_index :notes, :iso_8601_week_number
    rename_column :notes, :iso_8601_year, :year
    rename_column :notes, :iso_8601_week_number, :week_number
    add_index :notes, :year
    add_index :notes, :week_number
  end
end
