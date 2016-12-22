class CreateSmsThreads < ActiveRecord::Migration
  def change
    create_table :sms_threads , id: false do |t|
      t.string :subject_number, null: false
      t.timestamps null: false
      t.index :subject_number , unique: true
    end

  end
end
