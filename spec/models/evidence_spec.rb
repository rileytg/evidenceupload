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

    context "content types" do
      let(:image_evidence) {
        [
          create(:evidence, mime_type: "image/jpeg"),
          create(:evidence, mime_type: "image/gif"),
          create(:evidence, mime_type: "image/png")
        ]
      }

      let(:video_evidence) {
        [
          create(:evidence, mime_type: "video/mp4"),
          create(:evidence, mime_type: "video/ogg"),
          create(:evidence, mime_type: "video/webm")
        ]
      }

      it 'returns true for jpegs, pngs, and gifs and false for other mime_types when calling #image?' do
        image_evidence.all?(&:"image?").should be_true
        video_evidence.none?(&:"image?").should be_true
      end

      it 'returns true for mp4, ogg, webm and false for other mime_types when calling #video?' do
        image_evidence.none?(&:"video?").should be_true
        video_evidence.all?(&:"video?").should be_true
      end
    end
  end
end
