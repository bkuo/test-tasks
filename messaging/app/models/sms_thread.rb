# == Schema Information
#
# Table name: sms_threads
#
#  subject_number :string           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  last_received  :datetime
#  last_read      :datetime
#  unread_count   :integer          default(0)
#  account_id     :integer
#
# Indexes
#
#  index_sms_threads_on_last_received   (last_received)
#  index_sms_threads_on_subject_number  (subject_number) UNIQUE
#

class SmsThread < ActiveRecord::Base
  self.primary_key = :subject_number

  has_one :sms_message, ->() { order('created_at desc').limit(1) }, foreign_key: :subject_number
  has_many :sms_messages, ->() { order('created_at desc') }, foreign_key: :subject_number
  belongs_to :account

  def unread?
    return true unless last_read
    last_received > last_read
  end

end
