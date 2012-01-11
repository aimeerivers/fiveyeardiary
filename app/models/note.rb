class Note < ActiveRecord::Base

  belongs_to :user

  validates :content, presence: true
  validates :date, presence: true, date: {before_or_equal_to: Proc.new {|note| Time.now.in_time_zone(note.user.time_zone).to_date }, message: "cannot be in the future"}
  validates :date, uniqueness: {scope: [:user_id], :message => "You have already made a note for this day"}

  scope :for_day, lambda {|month, day| where(month: month, day: day) }
  scope :for_week_day, lambda {|weekday| where(week_day: weekday) }
  scope :for_week, lambda {|year, week_number| where(year: year, week_number: week_number) }
  scope :written_today, lambda { where(date: Date.today) }
  scope :by_date, order(:date)

  before_save :split_date_parts

  private

  def split_date_parts
    self.year = self.date.year
    self.month = self.date.month
    self.day = self.date.day
    self.week_number = self.date.cweek
    self.week_day = self.date.strftime('%u').to_i
  end

end
