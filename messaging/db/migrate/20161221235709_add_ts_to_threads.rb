class AddTsToThreads < ActiveRecord::Migration
  def change
    change_table :sms_threads do |t|
      t.datetime :last_received, :last_read
    end
  end
end
