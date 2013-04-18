class Evidence < ActiveRecord::Base
  attr_accessible :source, :url, :mime_type
  belongs_to :evidence_batch

  def image?
    %w(image/jpeg image/gif image/png).include?(mime_type)
  end

  def video?
    %w(video/mp4 video/webm video/ogg).include?(mime_type)
  end

  # Retrieves the media from S3 and reads its EXIF data
  def parse_exif!
    uri = URI(url)

    Rails.logger.info("Downloading evidence #{id} from filepicker.io")

    Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new(uri.path)

      http.request(request) do |response|
        file = Tempfile.new('evidence')
        file.binmode
        response.read_body do |chunk|
          file.write chunk
        end
        file.close

        exif = EXIFR::JPEG.new(file.path)
        if exif.gps
          Rails.logger.info("Storing GPS coordinates for evidence #{id}")
          self.longitude = exif.gps.longitude
          self.latitude = exif.gps.latitude
        end
        if exif.date_time
          Rails.logger.info("Storing captured_at for evidence #{id}")
          self.captured_at = exif.date_time
        end

        save!

        file.unlink
      end
    end
  end
end
