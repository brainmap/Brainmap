class ContactController < ApplicationController
  before_filter :login_required, :except => [:index, :send_mail]
  
  def index
    # render index.html.erb
  end

  def send_mail
    Notifications.deliver_inquiry(params[:email])
    flash[:notice] = "Email was succesfully sent."
    redirect_to root_url
  end
end
