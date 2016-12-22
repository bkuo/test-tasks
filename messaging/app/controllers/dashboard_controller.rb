class DashboardController < ApplicationController
  def index
    @threads = SmsThread.order('last_received desc').page(params[:page]).includes(:sms_message)
  end
end
