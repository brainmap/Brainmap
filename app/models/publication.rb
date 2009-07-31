class Publication < ActiveRecord::Base
  default_scope :order => 'publication_date DESC'
  
  
  has_many :authorships
  has_many :people, :through => :authorships
  
  validates_presence_of :title, :authors_info
  
  def pubmed_link
    "http://www.ncbi.nlm.nih.gov/pubmed/#{pmid}"
  end
  
  def year
    self.publication_date.beginning_of_year
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
