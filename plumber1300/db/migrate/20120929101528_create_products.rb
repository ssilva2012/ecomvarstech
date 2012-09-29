class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :productCode
      t.string :name
      t.string :uom
      t.string :category

      t.timestamps
    end
  end
end
