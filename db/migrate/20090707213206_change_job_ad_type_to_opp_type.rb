class ChangeJobAdTypeToOppType < ActiveRecord::Migration
  def self.up
    change_table :job_advertisements do |t|
      t.remove :type
      t.string :opp_type
    end
  end

  def self.down
    change_table :job_advertisements do |t|
      t.remove :opp_type
      t.string :type
    end
  end
end
