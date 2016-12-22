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

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:account) }
  it { should validate_presence_of(:account) }

  it { should have_many(:sms_messages) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
end
