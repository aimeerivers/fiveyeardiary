require 'spec_helper'

describe ApplicationHelper do

  describe 'previous_week' do
    it 'returns a previous week and year' do
      helper.previous_week('2012', '3').should == [2012, 2]
    end

    it 'rolls back over a year boundary' do
      helper.previous_week('2012', '1').should == [2011, 52]
    end
  end

  describe 'next_week' do
    it 'returns the next week and year' do
      helper.next_week('2012', '3').should == [2012, 4]
    end

    it 'rolls forward over a year boundary' do
      helper.next_week('2012', '52').should == [2013, 1]
    end
  end

end
