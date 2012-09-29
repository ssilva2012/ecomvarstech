class CreatePostcodes < ActiveRecord::Migration
  def change
    
    create_table :postcodes do |t|
      t.integer :postcode
      t.integer :isAvailable
      t.integer :maxLimit
      t.decimal :price, :price, precision: 8, scale: 2
      t.string :subrub
      
      t.timestamps
    end
  end
end
