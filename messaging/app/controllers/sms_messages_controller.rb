class SmsMessagesController < ApplicationController
  def index

    # @sms_messages = @account.sms_messages.sorted.includes([:user, :account]).limit(1)
    #
    # @account.sms_messages.sorted.includes([:user, :account]).limit(1)
    @thread =       SmsThread.find(params[:sms_thread_id])
    @sms_messages = @thread.sms_messages.includes([:user, :account])
  end
end
