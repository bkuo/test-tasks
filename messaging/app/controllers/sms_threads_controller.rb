class SmsThreadsController < ApplicationController
  def mark_as_unread
    thread = SmsThread.find(params[:id])
    thread.update_columns unread: true, last_read: Time.now
    redirect_to :back

  end
end
