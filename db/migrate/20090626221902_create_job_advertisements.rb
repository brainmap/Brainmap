class CreateJobAdvertisements < ActiveRecord::Migration
  def self.up
    create_table :job_advertisements do |t|
      t.string :title
      t.text :body
      t.integer :pvl
      t.text :body
      t.integer :responder_id

      t.timestamps
    end
  end

  def self.down
    drop_table :job_advertisements
  end
end
