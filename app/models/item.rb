class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  #has_many   :comments
  #has_one    :history
  belongs_to :category
  belongs_to :address
  belongs_to :condition
  belongs_to :postage
  belongs_to :deliver_day
  has_one_attached :image
  
  with_options presence: true do
    validates :title, :explain, :image
    validates :category_id, :address_id, :condition_id, :postage_id, :deliver_day_id, numericality: { other_than: 1 }
    validates :product_price, numericality:{only_integer:true, greater_than:299, less_than:10000000 }
  end 
end