class BroadcastMessagesController < ApplicationController
  def create
    BroadcastMessage.create body: params[:broadcast_message][:body], user: @user, account: @account
    redirect_to broadcast_messages_path
  end

  def index
    @messages  = BroadcastMessage.order('created_at desc').page(params[:page]).all
  end
end
