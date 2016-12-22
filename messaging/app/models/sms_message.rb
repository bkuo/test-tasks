# == Schema Information
#
# Table name: sms_messages
#
#  id          :integer          not null, primary key
#  account_id  :integer
#  user_id     :integer
#  from_number :string
#  to_number   :string
#  body        :text
#  outbound    :boolean          default(FALSE), not null
#  unread      :boolean          default(TRUE), not null
#  created_at  :datetime
#  updated_at  :datetime
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
      thread.update_attribute :last_received, Time.now
    else
      SmsThread.create subject_number: subject_number
    end
  end


end
