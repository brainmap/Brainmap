class Address < ActiveRecord::Base
  belongs_to :person
  
  def to_html
    out = ""
    out += "#{line1}<br />" unless line1.nil?
    out += "#{line2}<br />" unless line2.nil?
    out += "#{street}<br />"
    out += "#{city}, #{state}, #{zip}"
    return out
  end
end
