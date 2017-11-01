FactoryBot.define do
  factory :student do
    first_name "Johnny"
    last_name "Jones"
    grade_level "1"
    notes "good kid"
    sequence(:email) {|n| "me#{n}.@school.com"}
  end
end
