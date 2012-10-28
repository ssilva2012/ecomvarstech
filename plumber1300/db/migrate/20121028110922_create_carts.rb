class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :cart_id
      t.string :email
      t.integer :postcode
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
