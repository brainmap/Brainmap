class CreateBlurbs < ActiveRecord::Migration
  def self.up
    create_table :blurbs do |t|
      t.string :permalink
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :blurbs
  end
end
