class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def create
    content = params[:message][:content]
    @message = Message.create!(content: content)
    PrivatePub.publish_to("/messages/new", message: @message)
  end

end
