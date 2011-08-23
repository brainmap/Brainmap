xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "WADRC Publications"
    xml.description "Recent publications from the Imaging Core"
    xml.link formatted_publications_url(:rss)
    
    for pub in @publications
      xml.item do
        xml.title pub.title
        xml.description pub.abstract
        xml.pubDate pub.publication_date
        xml.link publication_url(pub)
        xml.guid publication_url(pub)
      end
    end
  end
end
