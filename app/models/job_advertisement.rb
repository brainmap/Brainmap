class JobAdvertisement < ActiveRecord::Base
  belongs_to :responder, :class_name => 'Person', :foreign_key => 'responder_id'
end
