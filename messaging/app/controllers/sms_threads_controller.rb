class SmsThreadsController < ApplicationController
  def mark_as_read
    thread = SmsThread.find(params[:id])
    thread.update_columns unread_count: 0, last_read: Time.now
    head 201

  end
end
