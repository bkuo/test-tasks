# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Account, type: :model do
  it { should have_many(:users) }

  it { should have_many(:sms_messages) }

  
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
