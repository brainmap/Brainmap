class Event < ActiveRecord::Base
  default_scope :order => 'date DESC'
  has_attached_file :image,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>",
      :medium => "300x300>",
      :large =>   "400x400>" 
    }
end
