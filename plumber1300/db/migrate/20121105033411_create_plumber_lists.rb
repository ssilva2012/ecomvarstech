class CreatePlumberLists < ActiveRecord::Migration
  def change
    create_table :plumber_lists do |t|
      t.string :postcode
      t.string :email
      t.date :createdDate
      t.date :expiryDate
      t.integer :isSuspended

      t.timestamps
    end
  end
end
