class SmsThread < ActiveRecord::Base
  self.primary_key = :subject_number

  has_one :sms_message, ->() { order('created_at desc').limit(1) }, foreign_key: :subject_number
  has_many :sms_messages, ->() { order('created_at desc') }, foreign_key: :subject_number
  # has_many :unread_messages, ->(){order('created_at desc').where('created_at > ?',rec.last_read)} ,class_name:  'SmsMessage',foreign_key: :subject_number

  def unread_messages
    return sms_messages unless self.last_read
    sms_messages.where('created_at > ?', self.last_read)
  end

  def unread?
    return true unless last_read
    last_received > last_read
  end

  def last_received
    super || created_at
  end
end
