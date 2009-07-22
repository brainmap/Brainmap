class AddGroupToPeople < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.string :group
    end
  end

  def self.down
    change_table :people do |t|
      t.remove :group
    end
  end
end
