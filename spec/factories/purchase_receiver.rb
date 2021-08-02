FactoryBot.define do
  factory :purchase_receiver do
    postal_code   {"123-4567"}
    ship_from_id  {1}
    city          {"柏"}
    address       {"1-1"}
    building_name {"三室ビル"}
    phone_number  {"09012345678"}
    token         {"tok_abcdefghijk00000000000000000"}
  end
  
end
