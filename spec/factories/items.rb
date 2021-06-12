FactoryBot.define do
  factory :item do
    item_name {Faker::Lorem.sentence}
    item_text {Faker::Lorem.sentence}

    Association :user
  end
end
