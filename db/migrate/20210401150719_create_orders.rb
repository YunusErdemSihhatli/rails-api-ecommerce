class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :number, null: false
      t.integer :state, null: false, default: 1
      t.integer :customer_id, null: false
      t.decimal :total_price, null: false
      t.integer :cart_id, null: false
      t.text :address, null: false
      t.text :products, null: false

      t.timestamps
    end
  end
end
