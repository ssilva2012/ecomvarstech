class CreatePostcodes < ActiveRecord::Migration
  def change
    create_table :postcodes do |t|
      t.integer :postcode
      t.string :suburb
      t.decimal :price
      t.integer :isAvailable
      t.integer :maxLimit

      t.timestamps
    end
  end
end
