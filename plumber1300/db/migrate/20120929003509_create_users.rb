class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :userType, default: 'USER'
      t.integer :remember, default: 0
      t.integer :enabled, default: 1
      t.integer :reset, default: 0

      t.timestamps

    end
  end
end
