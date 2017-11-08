FactoryBot.define do

  factory :parent do
    sequence(:email) {|n| "me#{n}.@gmail.com"}
    sequence(:first_name) {|n| "Betty#{n}"}
    last_name "Smith"
    password "password"
    phone_number "303-345-4567"
  end
end
