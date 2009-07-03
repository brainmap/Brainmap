class CreateStudyDescriptions < ActiveRecord::Migration
  def self.up
    create_table :study_descriptions do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :study_descriptions
  end
end
