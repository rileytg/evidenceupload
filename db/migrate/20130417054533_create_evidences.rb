class CreateEvidences < ActiveRecord::Migration
  def change
    create_table :evidences do |t|
      t.string :url
      t.string :source
      t.integer :evidence_batch_id

      t.timestamps
    end
  end
end
