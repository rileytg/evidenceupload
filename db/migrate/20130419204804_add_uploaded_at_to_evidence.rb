class AddUploadedAtToEvidence < ActiveRecord::Migration
  def change
    add_column :evidences, :uploaded_at, :datetime
  end
end
