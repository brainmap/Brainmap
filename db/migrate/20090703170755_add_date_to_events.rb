class AddDateToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.date :date
    end
  end

  def self.down
    change_table :events do |t|
      t.remove :date
    end
  end
end
