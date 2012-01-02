class Note < ActiveRecord::Base

  belongs_to :user

  validates :content, presence: true
  validates :date, presence: true, date: {before_or_equal_to: Proc.new {|note| Time.now.in_time_zone(note.user.time_zone).to_date }, message: "cannot be in the future"}
  validates :date, uniqueness: {scope: [:user_id], :message => "You have already made a note for this day"}

  scope :for_day, lambda {|month, day| where(month: month, day: day) }
  scope :by_date, order(:date)

  before_save :store_month_and_day

  private

  def store_month_and_day
    self.month = self.date.month
    self.day = self.date.day
  end

end
