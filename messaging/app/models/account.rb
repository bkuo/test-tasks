# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_accounts_on_name  (name) UNIQUE
#

class Account < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :users
  has_many :sms_messages
  has_many :sms_threads
  def unread_count
    sms_threads.where(unread: true).count
  end
end
