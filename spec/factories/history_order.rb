FactoryBot.define do
  factory :history_order do
    delivery_postalcode  {'123-4567'}         
    delivery_city        {'東京都'} 
    delivery_state       {'板橋区'} 
    delivery_phone       {'12345678910'} 
    delivery_building    {'半田ビル'} 
    address_id  { 2 } 
    token {"tok_abcdefghijk00000000000000000"}
  end
end
