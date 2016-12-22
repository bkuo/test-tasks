class AddIndexToUnread < ActiveRecord::Migration
  def up
    add_index :sms_messages, :unread, where: true
  end

  def down
    remove_index :sms_messages, :unread
  end
end