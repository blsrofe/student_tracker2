FactoryBot.define do

  factory :user do
    sequence(:email) {|n| "me#{n}.@gmail.com"}
    first_name "Joe"
    last_name "Smith"
    password "password"
  end
end
