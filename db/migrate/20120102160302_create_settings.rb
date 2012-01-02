class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.references :user
      t.string :time_zone

      t.timestamps
    end
    add_index :settings, :user_id
  end
end
