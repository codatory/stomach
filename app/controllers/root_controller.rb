class RootController < ApplicationController
  def index
    if params[:recipient] && params[:subject] && params[:message]
      recipient = Recipient.find(params[:recipient])
      message   = recipient.messages.create!({
        :subject => params[:subject],
        :message => params[:message]
      })

      # Deliver the message immediately in the background thread
      QMAIL.deliver_message!(message.id) if params[:instant]

      render :json => message
    else
      render :json => {:error => 'Missing required fields'}
    end
  end
end
