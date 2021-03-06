FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.sentence }
    item_text { Faker::Lorem.sentence }
    category_id        { 1 }
    status_id          { 1 }
    delivery_charge_id { 1 }
    ship_from_id       { 1 }
    shipping_day_id    { 1 }
    price              { 800 }

    association :user
    after(:build) do |item|
      item.images.attach(io: File.open(Rails.root.join('spec/fixtures/sample.png')), filename: 'sample.png')
    end
  end
end
