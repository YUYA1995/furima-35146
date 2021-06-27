class Order < ApplicationRecord

  belongs_to :history
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :address



  with_options presence: true do
    validates :delivery_postalcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :delivery_city, :delivery_state,:delivery_phone
    validates :address_id, numericality: { other_than: 1 }
  end
end 
