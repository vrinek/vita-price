require 'spec_helper'

describe Game do
  let(:nfs_game) { FactoryGirl.create :need_for_speed }
  let(:tearaway_game) { FactoryGirl.create :tearaway }

  describe "Need for Speed: Most Wanted" do
    subject { nfs_game }

    context "initially" do
      its(:psn_price) { should_not be }
      its(:title) { should_not be }
    end

    context "after fetching the price" do
      before do
        VCR.use_cassette('psn/nfs') do
          subject.fetch_psn_price!
        end
      end

      its(:psn_price) { should be }
      its(:psn_price) { should == 50 }
    end

    context "after fetching the title" do
      before do
        VCR.use_cassette('psn/nfs') do
          subject.fetch_psn_title!
        end
      end

      its(:title) { should be }
      its(:title) { should =~ /Need for Speed/i }
    end
  end

  describe "tearaway" do
    subject { tearaway_game }

    context "initially" do
      its(:psn_price) { should_not be }
      its(:title) { should_not be }
    end

    context "after fetching the price" do
      before do
        VCR.use_cassette('psn/tearaway') do
          subject.fetch_psn_price!
        end
      end

      its(:psn_price) { should be }
      its(:psn_price) { should == 25 }
    end

    context "after fetching the title" do
      before do
        VCR.use_cassette('psn/tearaway') do
          subject.fetch_psn_title!
        end
      end

      its(:title) { should be }
      its(:title) { should =~ /tearaway/i }
    end
  end
end
