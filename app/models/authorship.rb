class Authorship < ActiveRecord::Base
  belongs_to :person
  belongs_to :publication
end
