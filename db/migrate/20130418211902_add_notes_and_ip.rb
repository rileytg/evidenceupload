class AddNotesAndIp < ActiveRecord::Migration
  def change
    add_column :evidence_batches, :ip_address, :string
    add_column :evidence_batches, :notes, :text
  end
end
