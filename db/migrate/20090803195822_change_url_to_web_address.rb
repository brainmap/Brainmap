class ChangeUrlToWebAddress < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.rename :url, :web_address
    end
  end

  def self.down
    change_table :people do |t|
      t.rename :web_address, :url
    end
  end
end
