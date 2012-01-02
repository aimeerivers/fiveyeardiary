class User < ActiveRecord::Base

  validates :name, presence: true, on: :update

  has_many :notes
  has_one  :setting

  def time_zone
    return 'UTC' if setting.nil?
    setting.time_zone || 'UTC'
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

end
