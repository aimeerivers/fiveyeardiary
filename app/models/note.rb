class Note < ActiveRecord::Base

  belongs_to :user

  validates :content, presence: true
  validates :date, presence: true, date: {before: Proc.new { DateTime.current }, message: "cannot be in the future"}

end
