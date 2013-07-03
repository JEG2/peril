# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    sequence :name do |n|
      "Game #{n}"
    end
  end
end
