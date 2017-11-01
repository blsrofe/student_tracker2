FactoryBot.define do

  factory :klass do
    sequence(:title) {|n| "#{n} Class"}
    school_year "2017-2018"
    description "This is my class description"
    user
  end
end
