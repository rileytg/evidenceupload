class CreateEvidenceBatches < ActiveRecord::Migration
  def change
    create_table :evidence_batches do |t|
      t.string :email
      t.string :phone
      t.string :name

      t.timestamps
    end
  end
end
