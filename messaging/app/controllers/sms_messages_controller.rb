class SmsMessagesController < ApplicationController
  def index

    @thread =       SmsThread.find(params[:sms_thread_id])
    messages =     @thread.sms_messages.order('created_at desc').includes([:user])
    broadcast_messages = BroadcastMessage.where('created_at > ?', messages.last.created_at)
    @sms_messages = CombinedMessages.new(messages,broadcast_messages)

  end

  def create

  end
end
