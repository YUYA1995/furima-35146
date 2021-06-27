class HistoryOrder
  include ActiveModel::Model
  attr_accessor :delivery_postalcode, :delivery_city, :delivery_state, :delivery_phone, :address_id, :delivery_building, :user_id, :item_id, :image
  
  with_options presence: true do
    validates :delivery_postalcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :delivery_city, :delivery_state, :delivery_phone
  end
  validates :address_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    history = History.create(user_id: user_id, item_id: item_id)

    Order.create(delivery_postalcode: delivery_postalcode, delivery_city: delivery_city, delivery_state: delivery_state, address_id: address_id, delivery_phone: delivery_phone, delivery_building: delivery_building, history_id: history.id )
  end
end