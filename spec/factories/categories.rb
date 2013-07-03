# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    association :game

    sequence(:name) { |n|
      "Category #{n}"
    }
  end
end
