class AddOfficePhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :officePhone, :string

  end
end
