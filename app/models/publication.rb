class Publication < ActiveRecord::Base
  default_scope :order => 'publication_date DESC'
  
  has_many :people, :through => 'authorships'
  
  def pubmed_link
    "http://www.ncbi.nlm.nih.gov/pubmed/#{pmid}"
  end
  
end
