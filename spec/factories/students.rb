FactoryBot.define do
  factory :student do
    sequence(:first_name) {|n| "Johnny#{n}"}
    last_name "Jones"
    grade_level "1"
    notes "good kid"
    sequence(:email) {|n| "me#{n}.@school.com"}
  end
end
