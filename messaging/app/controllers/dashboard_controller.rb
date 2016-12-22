class DashboardController < ApplicationController
  def index
    @threads = SmsThread.order('updated_at desc').page(params[:page]).includes(:sms_message)


  end
end
