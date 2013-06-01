require 'spec_helper'
require 'chamberevents/scrape'

module Chamberevents
  describe Scrape do
    let(:cut) {Scrape}
    def sample
      @sample ||= File.read('doc/elginchamber201306.html')
    end

    let(:scrape) {cut.new(sample)}
    subject {scrape}

    its(:events) {should have(19).items}

    describe 'item' do
      subject {scrape.events[3]}
      it {subject[:title].should == 'Business After Hours at PanCor Construction & Development'}
      it {subject[:link].should match('elginchamber')}
      it {subject[:date].should == Date.new(2013, 6, 6)}
      it {subject[:time_start].should == DateTime.new(2013, 6, 6, 17, 0)}
      it {subject[:time_end].should == DateTime.new(2013, 6, 6, 19, 0)}
      it {subject[:all_day].should be_false}
    end

    describe 'all_day' do
      subject {scrape.events[0]}
      it {should_not include(:time_start)}
      it {should_not include(:time_end)}
      it {subject[:all_day].should be_true}
    end
  end
end
