FactoryBot.define do
  factory :observation do
    subject "Math"
    ob_type "Improvement"
    sequence(:comment) {|n| "#{n} My comment here"}
    date "2017-11-01"
    parent_viewable false
    student
    user
  end
end
