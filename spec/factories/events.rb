# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :viewed_event do
    association :answer
    game do |f|
      f.answer.category.game
    end
  end
end
