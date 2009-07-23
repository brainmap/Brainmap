# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  before_filter :login_required, :except => [ :show, :index, :research_objectives ]
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def index
    @active_nav_tab = 'brainmap-tab'
    @recent_news_items = Event.all.first(4)
    @recent_pubs = Publication.all.first(3)
    @courses_page = Page.find_by_title('Courses Offered')
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def research_objectives
    @active_nav_tab = 'about-tab'
    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
