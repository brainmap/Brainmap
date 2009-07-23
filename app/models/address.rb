class Address < ActiveRecord::Base
  belongs_to :person
  
  validates_presence_of :street, :city, :state, :zip
  
  def to_html
    out = ""
    out += "#{line1}<br />" unless line1.nil?
    out += "#{line2}<br />" unless line2.nil?
    out += "#{street}<br />"
    out += "#{city}, #{state}, #{zip}"
    return out
  end
end
