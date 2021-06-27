FactoryBot.define do
  factory :history_order do
    delivery_postalcode  {'123-4567'}         
    delivery_city        {'東京都'} 
    delivery_state       {'板橋区'} 
    delivery_phone       {'12345678910'} 
    delivery_building    {} 
    address_id  { 2 } 
  end
end
