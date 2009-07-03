class Person < ActiveRecord::Base
  default_scope :order => 'last_name ASC'
  
  has_one :address
  has_many :publications, :through => 'authorships'
  has_many :job_advertisements, :foreign_key => 'responder_id'
  
  accepts_nested_attributes_for :address, :allow_destroy => true
  
  has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>",
      :medium => "300x300>",
      :large =>   "400x400>" 
    }
end
