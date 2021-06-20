FactoryBot.define do
  factory :item do
    association :user
    title           {"猫"}
    explain         {"可愛い猫"}
    product_price   {"100000"}
    category_id     {2}
    deliver_day_id  {2}
    address_id      {2}
    condition_id    {2}
    postage_id      {2}
  end
end


