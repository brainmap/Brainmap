class ContactController < ApplicationController
  before_filter :login_required, :except => [:index, :send_mail]
  
  def index
    # render index.html.erb
  end

  def send_mail
    email_params = params[:email]

    # Temporarily Just Flag as Spam; deny sending later.
    if Akismet.spam?(akismet_attributes, request)
      flash[:error] = "I smell elderberries."
      email_params[:subject] = "[SPAM?] " + email_params[:subject] # flash[:error] = "Sorry, notification could not be sent."
    end

    Notifications.deliver_inquiry(email_params)
    flash[:notice] = "Email was succesfully sent."

    redirect_to root_url
  end
  
  private

  def akismet_attributes
    {
      :comment_author       => params[:email][:name],
      :comment_author_email => params[:email][:address],
      :comment_content      => params[:email][:body]
    }
  end
  
end
