require 'factory_girl'

FactoryGirl.define do

  factory :user do |f|
    f.name 'Name'
  end

  factory :identity do |f|
    f.name 'Name'
    f.password 'passw0rd'
    f.password_confirmation 'passw0rd'
  end

end
