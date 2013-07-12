# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  trait :event do
    association :answer
    game do |f|
      f.answer.category.game
    end
  end

  factory :viewed_event, traits: %i[event]

  factory :scored_event, traits: %i[event] do
    player do |f|
      f.association :player, game: f.game
    end
  end
end
