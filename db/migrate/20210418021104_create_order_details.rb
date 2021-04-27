class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.integer :price
      t.integer :product_status, default: "0"
      t.timestamps
    end
  end
end
