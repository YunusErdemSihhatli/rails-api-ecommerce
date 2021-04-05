class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.integer :stock, null: false, default: 0

      t.timestamps
    end
  end
end
