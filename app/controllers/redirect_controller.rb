class RedirectController < ApplicationController
  def index
    if params[:url]
      redirect_to params[:url], :status => :moved_permanently
      return
    else
      redirect_to "/"
    end
  end
end
