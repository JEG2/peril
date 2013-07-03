# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    association :category

    body     "It's another word with a meaning close to jeopardy."
    question "What is peril?"
  end
end
