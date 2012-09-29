class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :supplierCode
      t.string :name
      t.integer :enabled
      t.string :address1
      t.string :address2
      t.string :email
      t.string :suburb
      t.string :postCode
      t.string :regNo

      t.timestamps
    end
  end
end
