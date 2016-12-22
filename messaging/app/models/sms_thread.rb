class SmsThread < ActiveRecord::Base
  self.primary_key = :subject_number

  has_one :sms_message, ->(){order('created_at desc').limit(1)} ,foreign_key: :subject_number
  has_many :sms_messages, ->(){order('created_at desc')} ,foreign_key: :subject_number

  def unread?
    last_received > last_read
  end
  def last_read
    super || created_at
  end
  def last_received
    super || created_at
  end
end
