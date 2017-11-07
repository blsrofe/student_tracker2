# require "rails_helper"
#
# RSpec.describe AccountNotifierMailer, type: :mailer do
#   describe "inform" do
#     email = AccountNotifierMailer.inform("me@example.com", "teacher@example.com", Time.now)
#
#     # assert_email 1 do
#     #   email.deliver_now
#     # end
#     # fixture = read_fixture('inform').join# how do I do this in rspec, this is a minitest thing
#     expect(email.from).to eq("me@example.com")
#     expect(email.to).to eq("teacher@example.com")
#     expect(email.subject).to eq("Account created at Student Tracker")
#     expect(email.html_part.body.to_s).to eq(fixture)
#     expect(email.text_part.body.to_s).to eq(fixture)
#   end
# end
