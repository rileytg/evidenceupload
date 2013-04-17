class AddExifMetadata < ActiveRecord::Migration
  def change
    add_column :evidences, :captured_at, :datetime
    add_column :evidences, :longitude, :float
    add_column :evidences, :latitude, :float
    add_column :evidences, :mime_type, :string

    add_index :evidences, :evidence_batch_id
  end
end
