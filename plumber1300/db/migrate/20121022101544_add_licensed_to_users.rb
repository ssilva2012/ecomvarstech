class AddLicensedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :licensed, :integer, default: 1

  end
end
