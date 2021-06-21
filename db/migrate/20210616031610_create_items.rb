class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title,          null: false
      t.integer    :product_price,  null: false
      t.integer    :category_id,    null: false
      t.integer    :address_id,     null: false
      t.integer    :condition_id,   null: false
      t.integer    :postage_id,     null: false
      t.integer    :deliver_day_id, null: false
      t.text       :explain,        null: false
      t.references :user,           null: false, foreign_key: true


      t.timestamps
    end
  end
end