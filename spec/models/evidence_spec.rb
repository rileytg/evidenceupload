require 'spec_helper'

describe Evidence do
  describe "#parse_exif!" do
    before do
      @evidence = create(:evidence)
      jpeg = Rails.root.join('spec/fixtures/roomba.jpeg').read
      FakeWeb.register_uri(:get, @evidence.url, :body => jpeg)
    end

    it "should assign exif metadata" do
      @evidence.parse_exif!
      @evidence.longitude.should == -122.41966666666666
      @evidence.latitude.should == 37.788
      @evidence.captured_at.should == Time.parse('Sat, 20 Aug 2011 19:57:37 UTC')
    end
  end
end
