class AddLongBioToPerson < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.rename :research_activities, :brief_bio
      t.text :long_bio
    end
  end

  def self.down
    change_table :people do |t|
      t.rename :brief_bio, :research_activities
      t.remove :long_bio
    end
  end
end
