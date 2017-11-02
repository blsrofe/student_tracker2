FactoryBot.define do

  factory :user do
    sequence(:email) {|n| "me#{n}.@gmail.com"}
    sequence(:first_name) {|n| "Joe#{n}"}
    last_name "Smith"
    password "password"
  end
end
