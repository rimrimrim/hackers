class MessagesController < ApplicationController
  before_action :find_message, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def destroy
    @message.destroy
    redirect_to root_path
  end

  def update
    if @message.update(messages_params)
      redirect_to message_path
    else
      reder 'edit'
    end
  end

  private
  def find_message
    @message = Message.find(params[:id])
  end

  def messages_params
    params.require(:message).permit(:title, :description)
  end
end
