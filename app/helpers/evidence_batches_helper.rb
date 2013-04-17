module EvidenceBatchesHelper
  def image?(mime_type)
    %w(image/jpeg image/gif image/png).include?(mime_type)
  end
end
