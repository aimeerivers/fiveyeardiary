class Note < ActiveRecord::Base

  belongs_to :user

  validates :content, presence: true
  validates :date, presence: true, date: {before_or_equal_to: Proc.new {|note| Time.now.in_time_zone(note.user.time_zone).to_date }, message: "cannot be in the future"}
  validates :date, uniqueness: {scope: [:user_id], :message => "You have already made a note for this day"}

  scope :for_day, lambda {|month, day| where(month: month, day: day) }
  scope :for_week_day, lambda {|weekday| where(week_day: weekday) }
  scope :for_day_of_month, lambda {|day| where(day: day) }
  scope :for_week, lambda {|year, week_number| where(iso_8601_year: year, iso_8601_week_number: week_number) }
  scope :written_today, lambda { where(date: Date.today) }
  scope :since, lambda {|since_date| where(["date >= ?", since_date]) }
  scope :by_date, order(:date)

  before_save :split_date_parts

  private

  def split_date_parts
    self.iso_8601_year = self.date.strftime('%G').to_i
    self.month = self.date.month
    self.day = self.date.day
    self.iso_8601_week_number = self.date.strftime('%V').to_i
    self.week_day = self.date.strftime('%u').to_i
  end

end
