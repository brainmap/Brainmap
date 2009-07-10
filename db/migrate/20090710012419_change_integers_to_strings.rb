class ChangeIntegersToStrings < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.change :office_phone, :string
      t.change :office_phone_ext, :string
      t.change :lab_phone, :string
      t.change :lab_phone_ext, :string
      t.change :fax, :string
    end
    
    change_table :publications do |t|
      t.change :pmid, :string
    end
    
    change_table :job_advertisements do |t|
      t.change :pvl, :string
    end
    
    change_table :addresses do |t|
      t.change :zip, :string
    end
  end

  def self.down
    change_table :people do |t|
      t.change :office_phone, :integer
      t.change :office_phone_ext, :integer
      t.change :lab_phone, :integer
      t.change :lab_phone_ext, :integer
      t.change :fax, :integer
    end
    
    change_table :publications do |t|
      t.change :pmid, :integer
    end
    
    change_table :job_advertisements do |t|
      t.change :pvl, :integer
    end
    
    change_table :addresses do |t|
      t.change :zip, :integer
    end
  end
end
