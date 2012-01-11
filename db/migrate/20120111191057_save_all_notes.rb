class SaveAllNotes < ActiveRecord::Migration
  def up
    Note.all.each &:save
  end
end
