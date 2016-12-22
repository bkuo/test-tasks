class AddLastReceivedIdnex < ActiveRecord::Migration
  def up
    add_index :sms_threads, :last_received
  end
  def down
    remove_index :sms_threads, :last_received
  end
end
