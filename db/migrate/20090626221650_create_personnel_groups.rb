class CreatePersonnelGroups < ActiveRecord::Migration
  def self.up
    create_table :personnel_groups do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :personnel_groups
  end
end
