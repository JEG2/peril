# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reward do
    association :game

    sequence(:score) do |n|
      n * 100
    end
  end
end
