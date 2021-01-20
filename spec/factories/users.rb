FactoryBot.define do
  factory :user do
  user              {"test"}
  email { Faker::Internet.email }
  password { '1a' + Faker::Internet.password(min_length: 6, max_length: 20) }
  password_confirmation {password}
  profile            {"服が好き音楽が好き"}
  end
end