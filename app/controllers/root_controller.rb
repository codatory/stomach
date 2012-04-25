class RootController < ApplicationController
  def index
    if params[:recipient] && params[:subject] && params[:message]
      recipient = Recipient.find(params[:recipient])
      message   = recipient.messages.create!({
        :subject => params[:subject],
        :message => params[:message]
      })

      render :json => message
    else
      render :json => {:error => 'Missing required fields'}
    end
  end
end
