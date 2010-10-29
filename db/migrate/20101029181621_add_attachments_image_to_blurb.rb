class AddAttachmentsImageToBlurb < ActiveRecord::Migration
  def self.up
    add_column :blurbs, :image_file_name, :string
    add_column :blurbs, :image_content_type, :string
    add_column :blurbs, :image_file_size, :integer
    add_column :blurbs, :image_updated_at, :datetime
    add_column :blurbs, :style, :string
  end

  def self.down
    remove_column :blurbs, :image_file_name
    remove_column :blurbs, :image_content_type
    remove_column :blurbs, :image_file_size
    remove_column :blurbs, :image_updated_at
    remove_column :blurbs, :style
  end
end
