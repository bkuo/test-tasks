# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  account_id :integer
#  email      :string
#  name       :string
#  time_zone  :string
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_users_on_account_id  (account_id)
#  index_users_on_email       (email) UNIQUE
#  index_users_on_time_zone   (time_zone)
#

class User < ActiveRecord::Base
  belongs_to :account
  validates  :account, presence: true

  has_many :sms_messages

  # Skip all the Devise stuff for now

  validates :name, presence: true

  validates :email, presence: true, uniqueness: true
end
