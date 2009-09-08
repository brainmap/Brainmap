class JobAdvertisement < ActiveRecord::Base
  belongs_to :responder, :class_name => 'Person', :foreign_key => 'responder_id'
  
  validates_presence_of :title, :body, :opp_type
  validates_uniqueness_of :pvl, :allow_blank => true
end
