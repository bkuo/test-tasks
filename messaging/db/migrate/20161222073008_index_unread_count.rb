class IndexUnreadCount < ActiveRecord::Migration


  def up
    add_column :sms_threads, :unread, :boolean, default:  false
    add_index :sms_threads, [:account_id, :unread]
    remove_column :sms_threads, :unread_count
  end

  def down
    remove_column :sms_threads, :unread
    add_column :sms_threads, :unread_count, :integer, default: 0
  end
end
