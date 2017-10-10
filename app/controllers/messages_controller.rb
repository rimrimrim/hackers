class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
	   @message = Message.new
  end

  def create
    @message = Message.new(messages_params)

    if @message.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private
  def messages_params
    params.require(:message).permit(:title, :description)
  end
end
