class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.integer :customer_id, null: false
      t.integer :address_id
      t.integer :order_id

      t.timestamps
    end
  end
end
