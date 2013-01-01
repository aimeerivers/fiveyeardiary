require 'spec_helper'

describe Note do
  describe '#dom_id' do
    let(:note) { Note.new date: '2012-12-31' }

    it 'is just the date' do
      note.dom_id.should == '2012-12-31'
    end
  end
end
