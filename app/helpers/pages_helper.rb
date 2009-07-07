module PagesHelper
  def children_list(page)
    output = "<li>#{link_to page.title, page}</li>"
    output += "<ul>"
    page.children.each do |child|
      output += children_list(child)
    end
    output += "</ul>"
    return output
  end
end
