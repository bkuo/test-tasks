# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Account.delete_all
User.delete_all
SmsMessage.delete_all
SmsThread.delete_all

account = Account.first_or_create(name: 'OnboardIQ')

keith = account.users.find_or_create_by(
    name: "Keith", email: "keith@onboardiq.com")
yaroslav = account.users.find_or_create_by(
    name: "Yaroslav", email: "yaroslav@onboardiq.com")

# Let's create some sample messages to avoid confusion, shall we.
50_000.times do |x|
  subject = (1_000_000_000 + Random.rand(8_999_999_999)).to_s
  time = Random.rand(365.0 * 5.0).days.ago

# First, we replicate the screenshot
  account.sms_messages.create(
      outbound: true,
      from_number: "8006927753",
      to_number: subject,
      body: "This is a friendly reminder, respond YES or NO",
      created_at: time - 8.days)
  account.sms_messages.create(
      from_number: subject,
      to_number: "8006927753",
      body: "YES",
      created_at: time - 7.days)

# Now, let's do a simple thread with 2 operators, 1 annoyed user and
# 1 outbound message
  account.sms_messages.create(
      outbound: true,
      user: keith,
      to_number: subject,
      from_number: "8006927754",
      body: "Hey, so is there any chance we can move that meeting to 10am?",
      created_at: time - 6.days)
  account.sms_messages.create(
      to_number: "8006927754",
      from_number: subject,
      body: "Who is this? Leave me alone!11",
      created_at: time - 5.days)
  account.sms_messages.create(
      outbound: true,
      user: yaroslav,
      to_number: subject,
      from_number: "8006927754",
      body: "This is Yaroslav from OnboardIQ, are you sure you want to unsubscribe? You can send UNSUBSCRIBE any time.",
      created_at: time - 4.days)
  account.sms_messages.create(
      to_number: "8006927754",
      from_number: subject,
      body: "Stop doing this!!",
      created_at: time - 3.days)
  account.sms_messages.create(
      to_number: "8006927754",
      from_number: subject,
      body: "UNSUBSCRIBE",
      created_at: time - 3.days)
  account.sms_messages.create(
      outbound: true,
      to_number: subject,
      from_number: "8006927754",
      body: "You were unsubscribed successfully.",
      created_at: time - 2.days)

end

