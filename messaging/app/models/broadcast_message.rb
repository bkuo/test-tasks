# == Schema Information
#
# Table name: broadcast_messages
#
#  id         :integer          not null, primary key
#  account_id :integer
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_broadcast_messages_on_account_id  (account_id)
#  index_broadcast_messages_on_user_id     (user_id)
#

class BroadcastMessage < ActiveRecord::Base
  belongs_to :account
  belongs_to :user
  def from_number
    '8006927754'
  end
  def to_number
    '(Broadcast)'
  end
  def outbound
    true
  end
end
