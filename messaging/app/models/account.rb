# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class Account < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :users
  has_many :sms_messages
end
