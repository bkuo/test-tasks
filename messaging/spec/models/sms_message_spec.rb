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

require 'rails_helper'

RSpec.describe SmsMessage, type: :model do
  it { should belong_to(:account) }
  it { should validate_presence_of(:account) }

  it { should belong_to(:user) }
end
