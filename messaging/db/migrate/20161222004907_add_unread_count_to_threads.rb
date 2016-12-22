class AddUnreadCountToThreads < ActiveRecord::Migration
  def change
    change_table :sms_threads do |t|
      t.integer  :unread_count, default: 0
      t.references :account
    end
  end
end
