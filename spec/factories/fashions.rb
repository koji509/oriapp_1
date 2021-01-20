FactoryBot.define do
  factory :fashion do
    artist  {"the HIATUS"}
    brand   {"LAD MUSICIAN"}
    item    {"ジャケット"} 
    association :user
    association :comment

    after(:build) do |fashion|
      fashion.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end