class Evidence < ActiveRecord::Base
  attr_accessible :source, :url
  belongs_to :evidence_batch
end
