class EvidenceBatch < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :evidences, :evidences_attributes, :notes
  has_many :evidences, :dependent => :destroy
  accepts_nested_attributes_for :evidences, allow_destroy: true, reject_if: proc { |attributes| attributes['url'].blank? }

end
