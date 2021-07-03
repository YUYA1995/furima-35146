class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :delivery_postalcode, null: false
      t.string     :delivery_city,       null: false
      t.string     :delivery_state,      null: false
      t.string     :delivery_phone,      null: false
      t.string     :delivery_building
      t.integer    :address_id,          null: false
      t.references :history,             null: false, foreign_key: true 


      t.timestamps
    end
  end
end