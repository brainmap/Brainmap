class AddDegreeToPerson < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.string :degree
    end
  end

  def self.down
    change_table :people do |t|
      t.remove :degree
    end
  end
end
