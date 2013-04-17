class EvidenceBatch < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :evidences, :evidences_attributes
  has_many :evidences
  accepts_nested_attributes_for :evidences, allow_destroy: true, reject_if: proc { |attributes| attributes['url'].blank? }

end
