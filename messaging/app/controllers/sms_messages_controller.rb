class SmsMessagesController < ApplicationController
  def index

    # @sms_messages = @account.sms_messages.sorted.includes([:user, :account]).limit(1)
    #
    # @account.sms_messages.sorted.includes([:user, :account]).limit(1)
    @sms_messages = SmsThread.find(params[:sms_thread_id]).sms_messages.includes([:user, :account])
  end
end
