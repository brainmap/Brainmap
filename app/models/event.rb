class Event < ActiveRecord::Base
  default_scope :order => 'date DESC'
  has_attached_file :image,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>",
      :medium => "300x300>",
      :large =>   "400x400>" 
    }

  validates_attachment_size :image, :less_than => 2.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/bmp']

  validates_presence_of :title, :body, :date 

end
