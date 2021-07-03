FactoryBot.define do
  factory :history do  
    association :item
    association :user
  end
end
