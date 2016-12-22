class SmsMessagesController < ApplicationController
  def index

    @thread =       SmsThread.find(params[:sms_thread_id])
    messages =     @thread.sms_messages.order('created_at desc').includes([:user])
    broadcast_messages = BroadcastMessage.where('created_at > ?', messages.last.created_at)
    @sms_messages = CombinedMessages.new(messages,broadcast_messages)

  end

  def create
    @thread =       SmsThread.find(params[:sms_thread_id])
    return head 404 if @thread.nil?
    SmsMessage.create body: params[:sms_message][:body], to_number: '8006927754',
                      from_number: @thread.subject_number,
                      account: @account,
                      unread: true

    redirect_to sms_thread_sms_messages_path(@thread.subject_number)
  end
end
