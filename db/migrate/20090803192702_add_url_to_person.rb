class AddUrlToPerson < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.string :url
    end
  end

  def self.down
    change_table :people do |t|
      t.remove :url
    end
  end
end
