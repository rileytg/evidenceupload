class Evidence < ActiveRecord::Base
  attr_accessible :source, :url
  belongs_to :evidence_batch

  # Retrieves the media from S3 and reads its EXIF data
  def parse_exif!
    uri = URI(url)
    Net::HTTP.start(uri.host, uri.port) do |http|
      request = Net::HTTP::Get.new(uri.path)

      http.request(request) do |response|
        file = Tempfile.new('evidence')
        response.read_body do |chunk|
          file.write chunk
        end
        file.close

        exif = EXIFR::JPEG.new(file.path)
        self.longitude = exif.gps.longitude
        self.latitude = exif.gps.latitude
        self.captured_at = exif.date_time
        save!

        file.unlink
      end
    end
  end
end
