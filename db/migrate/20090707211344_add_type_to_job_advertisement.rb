class AddTypeToJobAdvertisement < ActiveRecord::Migration
  def self.up
    change_table :job_advertisements do |t|
      t.string :type
    end
  end

  def self.down
    change_table :job_advertisements do |t|
      t.remove :type
    end
  end
end
