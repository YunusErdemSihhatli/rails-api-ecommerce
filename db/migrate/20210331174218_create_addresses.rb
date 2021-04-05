class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone, null: false
      t.string :title, null: false
      t.string :description, null: false
      t.string :city_name, null: false
      t.string :town_name, null: false

      t.timestamps
    end
  end
end
