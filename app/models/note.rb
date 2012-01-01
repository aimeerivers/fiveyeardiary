class Note < ActiveRecord::Base

  belongs_to :user

  validates :content, presence: true
  validates :date, presence: true, date: {before: Proc.new { DateTime.current }, message: "cannot be in the future"}

  scope :for_day, lambda {|month, day| where(month: month, day: day) }
  scope :by_date, order(:date)

  before_save :store_month_and_day

  private

  def store_month_and_day
    self.month = self.date.month
    self.day = self.date.day
  end

end
