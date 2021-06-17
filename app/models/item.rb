class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_many   :comments
  has_one    :history
  belongs_to :category
  belongs_to :address
  belongs_to :condition
  belongs_to :postage
  belongs_to :deliver_day
  
  with_options presence: true do
    validates :title, :product_price, :explain
    validates :category_id, :address_id, :condition_id, :postage_id, :deliver_day_id, numericality: { other_than: 1 }
  end 
end