class Person < ActiveRecord::Base
  default_scope :order => 'job_title ASC, last_name ASC'
  VALID_GROUPS = ['Scientists','Research Staff','Graduate Students','Research Assistants','Collaborators','Alumni']
  
  has_one :address
  has_many :authorships
  has_many :publications, :through => :authorships
  has_many :job_advertisements, :foreign_key => 'responder_id'
  
  accepts_nested_attributes_for :address, :allow_destroy => true, :reject_if => proc { |attributes| attributes.values.map { |v| v == "" ? nil : v }.compact.empty? }
  
  
  has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>",
      :medium => "300x300>",
      :large =>   "400x400>" 
    }
    
  validates_attachment_size :photo, :less_than => 2.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/bmp']
  # validates_format_of :office_phone, :lab_phone, :with => /^(1\s*[-\/\.]?)?(\((\d{3})\)|(\d{3}))\s*[-\/\.]?\s*(\d{3})\s*[-\/\.]?\s*(\d{4})\s*(([xX]|[eE][xX][tT])\.?\s*(\d+))*$/ 
  # Reg. Expr lifted from: http://regexlib.com/DisplayPatterns.aspx?cattabindex=6&categoryId=7

  
  named_scope :in_group, lambda { |group_name|
    { :conditions => { :group => group_name } }
  }
  
  validates_presence_of :first_name, :last_name, :group
  validates_inclusion_of :group, :in => VALID_GROUPS
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def last_name_first
    "#{last_name}, #{first_name}"
  end
  
  def full_name_with_initial
    name = []
    name << first_name
    name << middle_initial if middle_initial
    name << last_name
    name.join(" ")
  end
  
  def office_phone_formatted
    "(#{office_phone.first(3)})#{office_phone[3..5]}-#{office_phone[6..9]} x #{office_phone_ext}"
  end
  def lab_phone_formatted
    "(#{lab_phone.first(3)})#{lab_phone[3..5]}-#{lab_phone[6..9]} x #{lab_phone_ext}"
  end
  def fax_formatted
    "(#{fax.first(3)})#{fax[3..5]}-#{fax[6..9]}"
  end
  
  def to_param
    "#{id}-#{lettered_name}"
  end
  
  def lettered_name
    name = []
    name << first_name.first
    name << middle_initial.first unless middle_initial.blank?
    name << "-"
    name << last_name
    # Including special characters will botch to_param (dots after intials, for example)
    return name.map{|s| CGI::escape(s) }.join
  end
  
end
