FactoryBot.define do
  factory :observation do
    subject "Math"
    type "Improvement"
    comment "MyText"
    date "2017-11-01"
    parent_viewable false
    student 
  end
end
