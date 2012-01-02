require 'spec_helper'

describe User do
  describe '#time_zone' do
    let(:user) { User.new }

    it 'is UTC if the user has no settings' do
      user.time_zone.should == 'UTC'
    end

    it 'is UTC if the user has not set a time zone in settings' do
      user.stub(setting: mock(:setting, time_zone: nil))
      user.time_zone.should == 'UTC'
    end

    it "is the user's specified time zone" do
      user.stub_chain([:setting, :time_zone]).and_return('Paris')
      user.time_zone.should == 'Paris'
    end
  end
end
