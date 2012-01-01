class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.date :date
      t.text :content
      t.references :user

      t.timestamps
    end
    add_index :notes, :user_id
  end
end
