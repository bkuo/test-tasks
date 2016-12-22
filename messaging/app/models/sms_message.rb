# == Schema Information
#
# Table name: sms_messages
#
#  id             :integer          not null, primary key
#  account_id     :integer
#  user_id        :integer
#  from_number    :string
#  to_number      :string
#  subject_number :string
#  body           :text
#  outbound       :boolean          default(FALSE), not null
#  unread         :boolean          default(TRUE), not null
#  created_at     :datetime
#  updated_at     :datetime
#  sms_thread_id  :integer
#
# Indexes
#
#  index_sms_messages_on_account_id      (account_id)
#  index_sms_messages_on_created_at      (created_at)
#  index_sms_messages_on_subject_number  (subject_number)
#  index_sms_messages_on_unread          (unread)
#  index_sms_messages_on_user_id         (user_id)
#

class SmsMessage < ActiveRecord::Base
  belongs_to :account
  validates :account, presence: true

  belongs_to :user
  belongs_to :sms_thread, foreign_key: :subject_number

  scope :unread, -> { where(unread: true) }
  scope :outbound, -> { where(outbound: true) }
  scope :sorted, -> { order(created_at: :desc) }


  before_save :add_subject_number

  def add_subject_number
    self.subject_number = self.outbound? ? to_number : from_number
  end

  after_save :add_or_touch_thread

  def add_or_touch_thread
    thread = SmsThread.where(subject_number: subject_number).first
    if thread
      thread.update_attribute :last_received, [self.created_at, thread.last_received].max
      thread.update_attribute :created_at, [self.created_at, thread.last_received].min # only for seeding purposes
    else
      thread = SmsThread.create subject_number: subject_number,  last_received: self.created_at, created_at: self.created_at,  account: self.account
    end
    thread.update_column :unread, true unless self.outbound
  end


end
