class Setting < ActiveRecord::Base

  belongs_to :user

  validates :time_zone, presence: true

end
