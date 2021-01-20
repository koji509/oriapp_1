FactoryBot.define do
  factory :comment do
    text {"かっこいいね"}
    association :user
    association :fashion
  end
end