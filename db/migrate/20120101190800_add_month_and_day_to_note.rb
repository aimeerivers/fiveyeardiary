class AddMonthAndDayToNote < ActiveRecord::Migration
  def change
    add_column :notes, :month, :integer
    add_column :notes, :day, :integer

    add_index :notes, :month
    add_index :notes, :day
  end
end
