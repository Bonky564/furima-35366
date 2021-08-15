FactoryBot.define do
  factory :item do
    title              {Faker::Name.initials}
    description        {'説明文'}
    category_id        {2}
    state_id           {2}
    price              {100000}
    delivery_charge_id {2}
    prefecture_id      {2}
    day_id             {2}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
