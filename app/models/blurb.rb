class Blurb < ActiveRecord::Base
  validates_presence_of :permalink, :content
end
