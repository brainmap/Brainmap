class RedirectController < ApplicationController
  def index
    headers["Status"] = "301 Moved Permanently"
    if params[:url]
      redirect_to params[:url]
      return
    else
      redirect_to "/"
    end
  end
end
