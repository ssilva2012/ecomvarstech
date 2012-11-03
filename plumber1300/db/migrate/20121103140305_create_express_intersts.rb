class CreateExpressIntersts < ActiveRecord::Migration
  def change
    create_table :express_intersts do |t|
      t.string :email
      t.string :postcode

      t.timestamps
    end
  end
end
