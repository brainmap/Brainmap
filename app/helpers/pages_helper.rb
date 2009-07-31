module PagesHelper
  def children_list(page, current_page = nil)
    output = ""
    if page == current_page
      output += "<li style='list-style-image:url(../images/objectives-bullet.jpg);'>#{page.title}</li>"
    else
      output = "<li>#{link_to page.title, page}</li>"
    end
    output += "<ul>"
    page.children.each do |child|
      output += children_list(child, current_page)
    end
    output += "</ul>"
    return output
  end
end
