class CreatePostcodeSuburbs < ActiveRecord::Migration
  def change
    create_table :postcode_suburbs do |t|
      t.integer :postcode
      t.string :suburb

      t.timestamps
    end
  end
end
