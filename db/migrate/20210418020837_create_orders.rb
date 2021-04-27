class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
       t.integer :end_user_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :payment_method, default: "0"
      t.integer :shipping_price, default: "800"
      t.integer :total_price
      t.integer :order_status, default: "0"
      t.timestamps
    end
  end
end
