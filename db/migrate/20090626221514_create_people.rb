class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_initial
      t.string :job_title
      t.integer :address_id
      t.integer :office_phone
      t.integer :office_phone_ext
      t.integer :lab_phone
      t.integer :lab_phone_ext
      t.integer :fax
      t.string :email
      t.text :research_activities

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
