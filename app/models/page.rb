class Page < ActiveRecord::Base
  acts_as_tree
  
  validates_presence_of :title, :content
  validates_uniqueness_of :permalink, :allow_nil => true
  
  def to_param
    "#{id}-#{title.gsub(" ", "-")[0..40]}"
  end
end
