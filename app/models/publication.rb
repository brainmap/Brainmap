class Publication < ActiveRecord::Base
  default_scope :order => 'publication_date DESC'
  
  
  has_many :authorships
  has_many :people, :through => :authorships
  
  validates_presence_of :title, :authors_info
    
  def pubmed_link
    "http://www.ncbi.nlm.nih.gov/pubmed/#{pmid}"
  end
  
  def year
    publication_date.blank? ? DateTime.current.beginning_of_year : publication_date.beginning_of_year 
  end
  
  def publication_or_inpress_date
    publication_date.blank? ? DateTime.now : publication_date
  end
  
  def abridged_abstract(n = 1)
    "#{abstract.split('. ').first(n).join('. ')}."
  end
  
  def contributer_publications
    contributer_publications = Set.new
    people.each do |person|
      person.publications.each do |pub|
        contributer_publications << pub unless (person.full_name == "Sterling Johnson" or pub == self)
      end
    end
    
    return contributer_publications
  end
end
