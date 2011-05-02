class Notifications < ActionMailer::Base
  
  def inquiry(email_params, sent_at = Time.now)
      subject "[brainmap.wisc.edu] " << email_params[:subject]
      recipients "FMRI <fmri@medicine.wisc.edu>"
      from "#{email_params[:name]} <#{email_params[:address]}>"
      reply_to "#{email_params[:name]} <#{email_params[:address]}>"
      sent_on sent_at

      # allows access to @message and @sender_name
      # in the view
      body({
        :message => email_params[:body], :study => email_params[:study], :category => email_params[:category], 
        :sender_name => email_params[:name], :sender_email => email_params[:address]
      })
  end
end
