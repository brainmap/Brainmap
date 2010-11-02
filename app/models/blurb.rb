class Blurb < ActiveRecord::Base
  validates_presence_of :permalink, :content
  
  has_attached_file :image, :styles => {
    :thumb=> "100x100#",
    :cell => "160x106#",
    :small  => "150x150>",
    :medium => "300x300>",
    :large =>   "700x700>" 
  }

  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/bmp']
end
