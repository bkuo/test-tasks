class AddSmsThreadIdToSmsMessages < ActiveRecord::Migration
  def change
    change_table :sms_messages do |t|
      t.references :sms_thread
    end
  end
end
